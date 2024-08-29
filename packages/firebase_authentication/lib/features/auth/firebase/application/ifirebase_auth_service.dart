import 'package:common/common.dart';
import 'package:firebase_authentication/features/auth/firebase/data/dto/phone_auth_response.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IFirebaseAuthService {
  Map<String, CountryCodeItem> getCountryItem();

  List<CountryCodeItem> getCountries();

  Future<Result<PhoneAuthResponse, Failure>> onSingInWithPhoneNumber(
    String phoneNumber,
  );
  Future<Result<PhoneAuthResponse, Failure>> onInputSmsCode(
    String verificationId,
    String smsCode,
  );

  Future<Result<PhoneAuthResponse, Failure>> onResendSmsCode(
    String phoneNumber,
    int resendToken,
  );

  Future<Result<bool, Failure>> upDateDisplayName(String displayName);

  Future<Result<bool, Failure>> signOut();
}
