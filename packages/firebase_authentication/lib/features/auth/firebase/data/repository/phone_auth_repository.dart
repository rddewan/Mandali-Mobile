import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:common/common.dart';
import 'package:common/dto/login_response.dart';
import 'package:core/core.dart';
import 'package:core/firebase/messaging/firebase_messaging_provider.dart';
import 'package:core/local/db/entity/setting_entity.dart';
import 'package:core/local/db/entity/user_entity.dart';
import 'package:core/local/db/isar_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/features/auth/firebase/data/api/login_with_firebase_token_api.dart';
import 'package:firebase_authentication/features/auth/firebase/data/dto/phone_auth_response.dart';
import 'package:firebase_authentication/features/auth/firebase/data/repository/iphone_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final phoneAuthRepositoryProvider =
    Provider.autoDispose<IPhoneAuthRepository>((ref) {
  final loginWithFirebaseTokenApi =
      ref.watch(loginWithFirebaseTokenApiProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  final isarDb = ref.watch(isarDbProvider);
  final firebaseMessaging = ref.watch(firebaseMessagingProvider);

  return PhoneAuthRepository(
    loginWithFirebaseTokenApi,
    secureStorage,
    isarDb,
    firebaseMessaging,
  );
});

final class PhoneAuthRepository implements IPhoneAuthRepository {
  final LoginWithFirebaseTokenApi _loginWithFirebaseTokenApi;
  final ISecureStorage _secureStorage;
  final IsarDb _isarDb;
  final FirebaseMessaging _firebaseMessaging;

  PhoneAuthRepository(
    this._loginWithFirebaseTokenApi,
    this._secureStorage,
    this._isarDb,
    this._firebaseMessaging,
  );

  @override
  Future<PhoneAuthResponse> onInputSmsCode(
    String verificationId,
    String smsCode,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      final result = await verificationCompleted(credential);

      return result;
    } on FirebaseAuthException catch (e) {
      throw Failure(message: e.message ?? '');
    }
  }

  @override
  Future<PhoneAuthResponse> onResendSmsCode(
    String phoneNumber,
    int resendToken,
  ) async {
    final result = Completer<PhoneAuthResponse>();

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            throw Failure(message: 'The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          result.complete(
            PhoneAuthResponse(
              isSmsSent: true,
              resendToken: resendToken,
              verificationId: verificationId,
              isSmsResend: true,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        forceResendingToken: resendToken,
      );

      return result.future;
    } on FirebaseAuthException catch (e) {
      throw Failure(message: e.message ?? '');
    }
  }

  @override
  Future<PhoneAuthResponse> onSingInWithPhoneNumber(String phoneNumber) async {
    try {
      final result = Completer<PhoneAuthResponse>();

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {
          result.complete(verificationCompleted(credential));
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            result.completeError(
              Failure(
                message: 'Please input a valid phone number.',
              ),
            );
          } else {
            result.completeError(
              Failure(
                message: e.message.toString(),
              ),
            );
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          result.complete(
            PhoneAuthResponse(
              isSmsSent: true,
              resendToken: resendToken,
              verificationId: verificationId,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          ///On Android devices which support automatic SMS code resolution,
          /// this handler will be called if the device has not
          /// automatically resolved an SMS message within a certain time frame.
          /// Once the time frame has passed, the device will no longer attempt to resolve
          /// any incoming messages.
          /// By default, the device waits for 30 seconds however this can be customized
          /// with the timeout argument:
        },
      );

      return result.future;
    } on FirebaseAuthException catch (e) {
      throw Failure(message: e.message ?? '');
    }
  }

  @override
  Future<PhoneAuthResponse> verificationCompleted(
    PhoneAuthCredential credential,
  ) async {
    try {
      final result =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return PhoneAuthResponse(
        userId: result.user?.uid,
        email: result.user?.email,
        phoneNumber: result.user?.phoneNumber,
        idToken: await result.user?.getIdToken(),
        smsCode: credential.smsCode,
        isSmsSent: false,
        isSmsResend: false,
      );
    } on FirebaseAuthException catch (e) {
      throw Failure(message: e.message ?? '');
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      FirebaseAuth.instance.signOut();

      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      throw Failure(message: e.message ?? '');
    }
  }

  @override
  Future<bool> upDateDisplayName(String displayName) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      await user?.updateDisplayName(displayName);
      await user?.reload();

      return true;
    } on FirebaseAuthException catch (e) {
      throw Failure(message: e.message ?? '');
    }
  }

  @override
  Future<bool> loginWithFirebaseToken(Map<String, dynamic> body) async {
    try {
      final response =
          await _loginWithFirebaseTokenApi.loginWithFirebaseToken(body);

      final token = response.data.token;
      final user = response.data.user;
      // map user dto to user entity
      final userEntity = await Isolate.run(() => _mapToUserEntity(user));
      // map setting dto to setting entity
      final settingEntity = await Isolate.run(() {
        return _mapToSettingEntity(user.church);
      });
      // store user in isar DB
      await _isarDb.writeUser(userEntity);
      // store setting in isar DB
      await _isarDb.writeSetting(settingEntity);
      // store token in secure storage
      await _secureStorage.write(accessTokenKey, token.accessToken);
      await _secureStorage.write(refreshTokenKey, token.refreshToken);
      // subscribe to topic - for push notifications
      _firebaseMessaging.subscribeToTopic(user.church.id.toString());

      return true;
    } on DioException catch (e, s) {
      if (e.error is SocketException) {
        throw Failure(message: e.message ?? '');
      }
      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          statusCode: e.response?.statusCode,
          stackTrace: s,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
        exception: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<String?> getValueFromSecureStorage(String key) async {
    try {
      return await _secureStorage.read(key);
    } catch (e, s) {
      throw Failure(
        message: e.toString(),
        stackTrace: s,
      );
    }
  }

  @override
  Future<UserEntity?> readUser() async {
    try {
      return await _isarDb.readUser();
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<void> writeUser(UserEntity user) async {
    try {
      await _isarDb.writeUser(user);
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }
}

UserEntity _mapToUserEntity(UserDto user) {
  final church = UserChurchEntity()
    ..id = user.church.id
    ..name = user.church.name;

  return UserEntity()
    ..id = user.id
    ..name = user.name
    ..email = user.email
    ..phoneNumber = user.phoneNumber
    ..role = user.role
        .map(
          (e) => RoleEntity()
            ..id = e.id
            ..name = e.name,
        )
        .toList()
    ..church = church;
}

SettingEntity _mapToSettingEntity(ChurchDto church) {
  return SettingEntity()..timeZone = church.timeZone;
}
