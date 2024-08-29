import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    String? name,
    String? email,
    String? phoneNumber,
  }) = _UserModel;
}
