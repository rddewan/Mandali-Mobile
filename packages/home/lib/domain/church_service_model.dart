import 'package:common/enum/church_service_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'church_service_model.freezed.dart';

@freezed
class ChurchServiceModel with _$ChurchServiceModel {
  const factory ChurchServiceModel({
    @Default([]) List<ChurchService> churchServices,
    @Default(Page()) Page page,
  }) = _ChurchServiceModel;
}

@freezed
class ChurchService with _$ChurchService {
  const factory ChurchService({
    int? id,
    String? date,
    String? chairPerson,
    String? preacher,
    @Default([]) List<String> bibleReaders,
    String? offering,
    String? worship,
    ChurchServiceType? serviceType,
    int? createdBy,
  }) = _ChurchService;
}

@freezed
class Page with _$Page {
  const factory Page({
    @Default(1) int currentPage,
    @Default(0) int total,
    @Default(0) int totalPage,
  }) = _Page;
}
