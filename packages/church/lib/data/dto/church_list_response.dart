import 'package:freezed_annotation/freezed_annotation.dart';

part 'church_list_response.freezed.dart';
part 'church_list_response.g.dart';

@freezed
class ChurchListResponse with _$ChurchListResponse {
  const factory ChurchListResponse({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "data") @Default([]) List<ChurchResponse> data,
  }) = _ChurchListResponse;

  factory ChurchListResponse.fromJson(Map<String, dynamic> json) =>
      _$ChurchListResponseFromJson(json);
}

@freezed
class ChurchResponse with _$ChurchResponse {
  const factory ChurchResponse({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "createdAt") required DateTime createdAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
  }) = _ChurchResponse;

  factory ChurchResponse.fromJson(Map<String, dynamic> json) =>
      _$ChurchResponseFromJson(json);
}
