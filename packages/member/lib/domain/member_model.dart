import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_model.freezed.dart';

@freezed
abstract class MemberModel with _$MemberModel {
  factory MemberModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String email,
    @Default('') String phoneNumber,
    String? photo,
    @Default([]) List<String> roles,
    @Default([]) List<String> guilds,
  }) = _MemberModel;
}
