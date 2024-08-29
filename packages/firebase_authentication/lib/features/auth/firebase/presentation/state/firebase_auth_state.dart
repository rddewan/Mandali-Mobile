import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_auth_state.freezed.dart';

@freezed
class FirebaseAuthState with _$FirebaseAuthState {
  const factory FirebaseAuthState({
    @Default('') final String countryCode,
    @Default('') final String selectedCountryCode,
    final CountryCodeItem? item,
    @Default([]) final List<CountryCodeItem> countries,
    String? verificationId,
    String? phoneNumber,
    int? resendToken,
    String? errorMsg,
    String? otpErrorMsg,
    String? userId,
    @Default(false) final bool isDisplayNameSet,
    @Default(false) final bool isSignOut,
    @Default(false) final bool isLoading,
    @Default(false) final bool isUserDeleted,
    @Default(false) final bool needToSignIn,
    @Default('') final String smsCode,
  }) = _FirebaseAuthState;
}
