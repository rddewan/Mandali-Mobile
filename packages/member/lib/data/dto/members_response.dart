import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member/data/dto/member_response.dart';

part 'members_response.freezed.dart';
part 'members_response.g.dart';

MembersResponse deserializeMembersResponse(Map<String, dynamic> json) =>
    MembersResponse.fromJson(json);

@freezed
class MembersResponse with _$MembersResponse {
  const factory MembersResponse({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "data") required List<MemberDto> data,
  }) = _MembersResponse;

  factory MembersResponse.fromJson(Map<String, dynamic> json) =>
      _$MembersResponseFromJson(json);
}
