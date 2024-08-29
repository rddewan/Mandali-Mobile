import 'package:freezed_annotation/freezed_annotation.dart';

part 'church_setting_response.freezed.dart';
part 'church_setting_response.g.dart';

ChurchSettingResponse deserializeChurchSettingResponse(
  Map<String, dynamic> json,
) =>
    ChurchSettingResponse.fromJson(json);

@freezed
class ChurchSettingResponse with _$ChurchSettingResponse {
  const factory ChurchSettingResponse({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "data") required Data data,
  }) = _ChurchSettingResponse;

  factory ChurchSettingResponse.fromJson(Map<String, dynamic> json) =>
      _$ChurchSettingResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "churchId") required int churchId,
    @JsonKey(name: "timeZone") required String timeZone,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
