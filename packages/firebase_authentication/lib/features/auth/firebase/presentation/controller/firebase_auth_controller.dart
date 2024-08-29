import 'package:common/common.dart';
import 'package:firebase_authentication/features/auth/firebase/application/firebase_auth_service.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/state/firebase_auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthControllerProvider =
    NotifierProvider<FirebaseAuthController, FirebaseAuthState>(
  FirebaseAuthController.new,
);

class FirebaseAuthController extends Notifier<FirebaseAuthState> {
  @override
  FirebaseAuthState build() {
    return const FirebaseAuthState();
  }

  void getCountryItem(String countryCode) async {
    final result =
        ref.read(firebaseAuthServiceProvider).getCountryItem()[countryCode];

    state = state.copyWith(
      countryCode: '${result?.name} (+${result?.phoneCode})',
      selectedCountryCode: '+${result?.phoneCode}',
      item: result,
    );
  }

  void setCountryCode(CountryCodeItem value) {
    state = state.copyWith(
      countryCode: '${value.countryCode} (+${value.phoneCode})',
      selectedCountryCode: '+${value.phoneCode}',
    );
  }

  void setPhoneNumber(String value) {
    state = state.copyWith(
      phoneNumber: '${state.selectedCountryCode}$value',
    );
  }

  void signInWithPhone() async {
    final service = ref.read(firebaseAuthServiceProvider);
    state = state.copyWith(isLoading: true, errorMsg: null);

    final phoneNumber = state.phoneNumber ?? '';
    final result = await service.onSingInWithPhoneNumber(phoneNumber);
    result.when(
      (success) {
        state = state.copyWith(
          isLoading: false,
          smsCode: success.smsCode ?? '',
          phoneNumber: phoneNumber,
          verificationId: success.verificationId,
          resendToken: success.resendToken,
        );
      },
      (error) {
        state = state.copyWith(
          isLoading: false,
          errorMsg: error.message,
        );
      },
    );
  }

  void onInputSmsCode(String smsCode) async {
    final service = ref.read(firebaseAuthServiceProvider);
    state = state.copyWith(
      isLoading: true,
      errorMsg: null,
      otpErrorMsg: null,
    );

    final verificationId = state.verificationId;

    if (verificationId == null || verificationId.isEmpty) return;

    final result = await service.onInputSmsCode(
      verificationId,
      smsCode,
    );

    result.when(
      (success) {
        state = state.copyWith(
          isLoading: false,
          userId: success.userId,
          phoneNumber: '',
          verificationId: success.verificationId,
          resendToken: success.resendToken,
        );
      },
      (error) {
        state = state.copyWith(isLoading: false, otpErrorMsg: error.message);
      },
    );
  }

  void onResendSmsCode() async {
    final service = ref.read(firebaseAuthServiceProvider);
    state = state.copyWith(isLoading: true, errorMsg: null);

    final phoneNumber = state.phoneNumber;
    final resendToken = state.resendToken;

    final hasResendToken = resendToken != null;
    final hasPhoneNumber = phoneNumber != null && phoneNumber.isNotEmpty;

    if (!hasResendToken || !hasPhoneNumber) return;

    final result = await service.onResendSmsCode(
      phoneNumber,
      resendToken,
    );

    result.when(
      (success) {
        state = state.copyWith(
          isLoading: false,
          phoneNumber: phoneNumber,
          verificationId: success.verificationId,
          resendToken: success.resendToken,
        );
      },
      (error) {
        state = state.copyWith(isLoading: false, errorMsg: error.message);
      },
    );
  }

  void upDateDisplayName(String displayName) async {
    final service = ref.read(firebaseAuthServiceProvider);
    state = state.copyWith(isLoading: true, errorMsg: null);

    final result = await service.upDateDisplayName(displayName);
    result.when((success) {
      state = state.copyWith(isLoading: false, isDisplayNameSet: success);
    }, (error) {
      state = state.copyWith(isLoading: false, errorMsg: error.message);
    });
  }

  void signOut() async {
    final service = ref.read(firebaseAuthServiceProvider);
    state = state.copyWith(isLoading: true, errorMsg: null);

    final result = await service.signOut();
    result.when(
      (success) {
        state = state.copyWith(
          isSignOut: success,
          isLoading: false,
        );
      },
      (error) {
        state = state.copyWith(
          errorMsg: error.message,
          isLoading: false,
        );
      },
    );
  }
}
