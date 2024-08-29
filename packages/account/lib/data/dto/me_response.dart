import 'package:common/dto/login_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'me_response.freezed.dart';
part 'me_response.g.dart';

@freezed
class MeResponse with _$MeResponse {
  const factory MeResponse({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "data") required UserDto data,
  }) = _MeResponse;

  factory MeResponse.fromJson(Map<String, dynamic> json) =>
      _$MeResponseFromJson(json);
}
