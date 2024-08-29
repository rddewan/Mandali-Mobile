import 'package:common/dto/login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_me_response.freezed.dart';
part 'delete_me_response.g.dart';

@freezed
class DeleteMeResponse with _$DeleteMeResponse {
  const factory DeleteMeResponse({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "data") UserDto? data,
  }) = _DeleteMeResponse;

  factory DeleteMeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMeResponseFromJson(json);
}
