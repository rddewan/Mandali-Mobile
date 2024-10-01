import 'dart:io';
import 'dart:isolate';

import 'package:account/data/api/account_api.dart';
import 'package:account/data/dto/profile_photo_response.dart';
import 'package:account/data/repository/iaccount_repository.dart';
import 'package:common/common.dart';
import 'package:common/dto/login_response.dart';
import 'package:core/core.dart';
import 'package:core/local/db/entity/user_entity.dart';
import 'package:core/local/db/isar_db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

final accountRepositoryProvider =
    Provider.autoDispose<IAccountRepository>((ref) {
  final accountApi = ref.watch(accountApiProvider);
  final isarDb = ref.watch(isarDbProvider);
  final secureStorage = ref.watch(secureStorageProvider);

  return AccountRepository(accountApi, isarDb, secureStorage);
});

final class AccountRepository implements IAccountRepository {
  final AccountApi _accountApi;
  final IsarDb _isarDb;
  final ISecureStorage _secureStorage;

  AccountRepository(
    this._accountApi,
    this._isarDb,
    this._secureStorage,
  );

  @override
  Future<UserEntity?> me() async {
    try {
      // read from api
      final response = await _accountApi.me();
      // map to user entity
      final userEntity =
          await Isolate.run(() => _mapToUserEntity(response.data));
      // store in db
      await writeUser(userEntity);
      // read from db
      final result = readUser();

      return result;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: e.message ?? '');
      }
      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          statusCode: e.response?.statusCode,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
        exception: e,
      );
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
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

  @override
  Future<void> deleteMe() async {
    try {
      // delete from api
      await _accountApi.deleteMe();
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: e.message ?? '');
      }
      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          statusCode: e.response?.statusCode,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
        exception: e,
      );
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<UserEntity?> updateMe(Map<String, dynamic> body) async {
    try {
      // update in firebase
      final User? user = FirebaseAuth.instance.currentUser;
      await user?.updateDisplayName(body['name']);
      await user?.reload();

      // update in api
      final response = await _accountApi.updateMe(body);
      // map to user entity
      final userEntity =
          await Isolate.run(() => _mapToUserEntity(response.data));
      // store in db
      await writeUser(userEntity);
      // read from db
      final result = readUser();

      return result;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: e.message ?? '');
      }
      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          statusCode: e.response?.statusCode,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
        exception: e,
      );
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      // delete from db
      await _isarDb.deleteAll();
      // delete from secure storage
      await _secureStorage.delete(accessTokenKey);
      await _secureStorage.delete(refreshTokenKey);

      return true;
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<void> clearData() async {
    try {
      // delete from db
      await _isarDb.deleteAll();
      // delete from secure storage
      await _secureStorage.delete(accessTokenKey);
      await _secureStorage.delete(refreshTokenKey);
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }

  @override
  Future<ProfilePhotoResponse> uploadProfilePhoto(File photo) async {
    try {
      // upload profile photo in api
      final response = await _accountApi.uploadProfilePhoto(photo);

      return response;
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: (e.error as SocketException).message);
      }
      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          statusCode: e.response?.statusCode,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
        exception: e,
      );
    } catch (e, s) {
      throw Failure(message: e.toString(), stackTrace: s);
    }
  }
}

UserEntity _mapToUserEntity(UserDto response) {
  final church = UserChurchEntity()
    ..id = response.church.id
    ..name = response.church.name;

  return UserEntity()
    ..id = response.id
    ..name = response.name
    ..email = response.email
    ..phoneNumber = response.phoneNumber
    ..photo = response.photo
    ..role = response.role
        .map(
          (e) => RoleEntity()
            ..id = e.id
            ..name = e.name,
        )
        .toList()
    ..guild = response.guild
        .map(
          (e) => GuildEntity()
            ..id = e.id
            ..name = e.name
            ..description = e.name.guildName,
        )
        .toList()
    ..church = church;
}
