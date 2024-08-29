import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_auth_response.freezed.dart';
part 'phone_auth_response.g.dart';

@immutable
@freezed
abstract class PhoneAuthResponse with _$PhoneAuthResponse {
  const factory PhoneAuthResponse({
    String? userId,
    String? email,
    String? phoneNumber,
    String? smsCode,
    String? idToken,
    int? resendToken,
    String? verificationId,
    @Default(false) bool? isSmsSent,
    @Default(false) bool? isSmsResend,
  }) = _PhoneAuthResponse;

  factory PhoneAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneAuthResponseFromJson(json);
}
