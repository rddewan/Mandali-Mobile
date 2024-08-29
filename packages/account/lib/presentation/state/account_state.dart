import 'package:core/local/db/entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.freezed.dart';

@freezed
abstract class AccountState with _$AccountState {
  factory AccountState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    @Default(false) bool isDeleteting,
    @Default(false) bool isSigningOut,
    @Default({}) Map<String, dynamic> updateMeFormData,
    String? profilePhotoUrl,
    bool? isDeleteMe,
    bool? isSignOut,
    UserEntity? user,
    int? statusCode,
    String? errorMsg,
  }) = _AccountState;
}
