import 'dart:io';

import 'package:account/application/account_service.dart';
import 'package:account/presentation/state/account_state.dart';
import 'package:common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountControllerProvider =
    AutoDisposeNotifierProvider<AccountController, AccountState>(
  AccountController.new,
);

class AccountController extends AutoDisposeNotifier<AccountState> {
  @override
  AccountState build() {
    return AccountState();
  }

  Future<void> me() async {
    state = state.copyWith(
      isLoading: true,
      errorMsg: null,
      statusCode: null,
    );

    final user = await ref.read(accountServiceProvider).me();
    user.when(
      (user) {
        state = state.copyWith(
          isLoading: false,
          user: user,
          profilePhotoUrl: user?.photo,
        );
      },
      (error) {
        state = state.copyWith(
          isLoading: false,
          errorMsg: error.message,
          statusCode: error.statusCode,
        );
      },
    );
  }

  Future<void> uploadProfilePhoto(File photo) async {
    final service = ref.read(accountServiceProvider);

    state = state.copyWith(
      isUpdating: true,
      errorMsg: null,
      statusCode: null,
    );

    final result = await service.uploadProfilePhoto(photo);
    result.when(
      (success) {
        state = state.copyWith(
          isUpdating: false,
          profilePhotoUrl: success,
        );
      },
      (error) {
        state = state.copyWith(
          isUpdating: false,
          errorMsg: error.message,
          statusCode: error.statusCode,
        );
      },
    );
  }

  Future<void> updateMe() async {
    state = state.copyWith(
      isUpdating: true,
      errorMsg: null,
      statusCode: null,
    );

    final user = await ref.read(accountServiceProvider).updateMe(
          state.updateMeFormData,
        );

    user.when(
      (user) {
        state = state.copyWith(
          isUpdating: false,
          user: user,
          profilePhotoUrl: user?.photo,
        );
      },
      (error) {
        state = state.copyWith(
          isUpdating: false,
          errorMsg: error.message,
          statusCode: error.statusCode,
        );
      },
    );
  }

  Future<void> readUser() async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await ref.read(accountServiceProvider).readUser();

      state = state.copyWith(isLoading: false, user: user);
    } on Failure catch (e) {
      state = state.copyWith(isLoading: false, errorMsg: e.message);
    }
  }

  Future<void> deleteMe() async {
    state = state.copyWith(
      isDeleteting: true,
      errorMsg: null,
      statusCode: null,
    );

    final result = await ref.read(accountServiceProvider).deleteMe();
    result.when(
      (success) {
        state = state.copyWith(isDeleteting: false, isDeleteMe: success);
      },
      (error) {
        state = state.copyWith(
          isDeleteting: false,
          errorMsg: error.message,
          statusCode: error.statusCode,
        );
      },
    );
  }

  Future<void> signOut() async {
    final service = ref.read(accountServiceProvider);

    state = state.copyWith(
      isSigningOut: true,
      errorMsg: null,
      statusCode: null,
    );

    final result = await service.signOut();
    result.when(
      (success) {
        state = state.copyWith(
          isSignOut: success,
          isSigningOut: false,
        );
      },
      (error) {
        state = state.copyWith(
          isSigningOut: false,
          errorMsg: error.message,
          statusCode: error.statusCode,
        );
      },
    );
  }

  Future<void> clearData() async {
    final result = await ref.read(accountServiceProvider).clearData();
    result.when(
      (success) {},
      (error) {
        state = state.copyWith(
          errorMsg: error.message,
        );
      },
    );
  }

  void setUpdateMeFormData(String key, dynamic value) {
    state = state.copyWith(
      updateMeFormData: {
        ...state.updateMeFormData,
        ...{key: value},
      },
    );
  }
}
