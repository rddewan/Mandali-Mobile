import 'package:core/local/db/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/features/auth/firebase/data/dto/phone_auth_response.dart';

abstract interface class IPhoneAuthRepository {
  Future<bool> loginWithFirebaseToken(Map<String, dynamic> body);

  Future<PhoneAuthResponse> verificationCompleted(
    PhoneAuthCredential credential,
  );

  Future<String?> getValueFromSecureStorage(String key);

  Future<PhoneAuthResponse> onSingInWithPhoneNumber(String phoneNumber);

  Future<PhoneAuthResponse> onInputSmsCode(
    String verificationId,
    String smsCode,
  );

  Future<PhoneAuthResponse> onResendSmsCode(
    String phoneNumber,
    int resendToken,
  );

  Future<bool> upDateDisplayName(String displayName);

  Future<bool> signOut();

  Future<UserEntity?> readUser();

  Future<void> writeUser(UserEntity user);
}
