import 'package:common/enum/church_service_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'church_service_response.freezed.dart';
part 'church_service_response.g.dart';

@freezed
class ChurchServicesResponse with _$ChurchServicesResponse {
  const factory ChurchServicesResponse({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "data") @Default([]) List<ChurchServiceData> data,
    @JsonKey(name: "page") @Default(PageDto()) PageDto page,
  }) = _ChurchServicesResponse;

  factory ChurchServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ChurchServicesResponseFromJson(json);
}

@freezed
class ChurchServiceResponse with _$ChurchServiceResponse {
  const factory ChurchServiceResponse({
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "data") ChurchServiceData? data,
  }) = _ChurchServiceResponse;

  factory ChurchServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$ChurchServiceResponseFromJson(json);
}

@freezed
class ChurchServiceData with _$ChurchServiceData {
  const factory ChurchServiceData({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "date") required DateTime date,
    @JsonKey(name: "chairPerson") required String chairPerson,
    @JsonKey(name: "preacher") required String preacher,
    @JsonKey(name: "bibleReaders") @Default([]) List<String> bibleReaders,
    @JsonKey(name: "offering") String? offering,
    @JsonKey(name: "worship") String? worship,
    @JsonKey(name: "serviceType") required ChurchServiceType serviceType,
    @JsonKey(name: "createdBy") required int createdBy,
    @JsonKey(name: "createAt") required DateTime createAt,
    @JsonKey(name: "updatedAt") required DateTime updatedAt,
  }) = _ChurchServiceData;

  factory ChurchServiceData.fromJson(Map<String, dynamic> json) =>
      _$ChurchServiceDataFromJson(json);
}

@freezed
class PageDto with _$PageDto {
  const factory PageDto({
    @JsonKey(name: "currentPage") @Default(1) int currentPage,
    @JsonKey(name: "total") @Default(0) int total,
    @JsonKey(name: "totalPage") @Default(0) int totalPage,
  }) = _PageDto;

  factory PageDto.fromJson(Map<String, dynamic> json) =>
      _$PageDtoFromJson(json);
}
