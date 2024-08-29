import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:firebase_authentication/features/auth/firebase/application/ifirebase_auth_service.dart';
import 'package:firebase_authentication/features/auth/firebase/data/dto/phone_auth_response.dart';
import 'package:firebase_authentication/features/auth/firebase/data/repository/iphone_auth_repository.dart';
import 'package:firebase_authentication/features/auth/firebase/data/repository/phone_auth_repository.dart';
import 'package:firebase_authentication/features/auth/firebase/domain/countries.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:account/data/repository/iaccount_repository.dart';
import 'package:account/data/repository/account_repository.dart';

final firebaseAuthServiceProvider =
    Provider.autoDispose<IFirebaseAuthService>((ref) {
  final phoneAuthRepository = ref.watch(phoneAuthRepositoryProvider);
  final accountRepository = ref.watch(accountRepositoryProvider);

  return FirebaseAuthService(phoneAuthRepository, accountRepository);
});

final class FirebaseAuthService implements IFirebaseAuthService {
  final IPhoneAuthRepository _phoneAuthRepository;
  final IAccountRepository _accountRepository;

  FirebaseAuthService(this._phoneAuthRepository, this._accountRepository);

  Future<String?> _getFromSecureStorage(String key) async {
    final result = await _phoneAuthRepository.getValueFromSecureStorage(key);

    return result;
  }

  Future<bool> _loginWithFirebaseToken(String churchId, String token) async {
    final result = await _phoneAuthRepository.loginWithFirebaseToken({
      'churchId': int.parse(churchId),
      'token': token,
    });

    return result;
  }

  @override
  Map<String, CountryCodeItem> getCountryItem() {
    final result = countries.fold<Map<String, CountryCodeItem>>(
      {},
      (previousValue, element) {
        previousValue[element.countryCode] = element;
        return previousValue;
      },
    );

    return result;
  }

  @override
  List<CountryCodeItem> getCountries() {
    return countries.toList();
  }

  @override
  Future<Result<PhoneAuthResponse, Failure>> onInputSmsCode(
    String verificationId,
    String smsCode,
  ) async {
    try {
      final result = await _phoneAuthRepository.onInputSmsCode(
        verificationId,
        smsCode,
      );

      final churchId = await _getFromSecureStorage(churchIdKey);
      final token = result.idToken;

      // validate churchId and token
      if (churchId == null) return Error(Failure(message: 'churchId is null'));
      if (token == null) return Error(Failure(message: 'Token is null'));

      // login with firebase token to REST API
      await _loginWithFirebaseToken(churchId, token);

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<PhoneAuthResponse, Failure>> onResendSmsCode(
    String phoneNumber,
    int resendToken,
  ) async {
    try {
      final result = await _phoneAuthRepository.onResendSmsCode(
        phoneNumber,
        resendToken,
      );

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<PhoneAuthResponse, Failure>> onSingInWithPhoneNumber(
    String phoneNumber,
  ) async {
    try {
      final result = await _phoneAuthRepository.onSingInWithPhoneNumber(
        phoneNumber,
      );

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<bool, Failure>> signOut() async {
    try {
      final result = await _phoneAuthRepository.signOut();

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<bool, Failure>> upDateDisplayName(String displayName) async {
    try {
      // update displayName
      await _accountRepository.updateMe({'name': displayName});
      final result = await _phoneAuthRepository.upDateDisplayName(displayName);

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }
}
