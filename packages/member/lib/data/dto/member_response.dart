import 'package:common/dto/login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_response.freezed.dart';
part 'member_response.g.dart';

MemberResponse deserializeMemberResponse(Map<String, dynamic> json) =>
    MemberResponse.fromJson(json);

@freezed
class MemberResponse with _$MemberResponse {
  const factory MemberResponse({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "data") required MemberDto data,
  }) = _MemberResponse;

  factory MemberResponse.fromJson(Map<String, dynamic> json) =>
      _$MemberResponseFromJson(json);
}

@freezed
class MemberDto with _$MemberDto {
  const factory MemberDto({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "phoneNumber") required dynamic phoneNumber,
    @JsonKey(name: "photo") String? photo,
    @JsonKey(name: "role") required List<RoleDto> role,
  }) = _MemberDto;

  factory MemberDto.fromJson(Map<String, dynamic> json) =>
      _$MemberDtoFromJson(json);
}
