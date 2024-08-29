import 'package:core/local/db/entity/setting_entity.dart';
import 'package:core/local/db/entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/church_service_model.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool isChurchServiceLoading,
    @Default(false) bool isDeleting,
    @Default(false) bool isUpdating,
    @Default(false) bool isFetching,
    @Default(false) bool isFetchingDetail,
    @Default(false) bool isScrolling,
    @Default(0) int currentPage,
    @Default(0) int totalPage,
    @Default(0) int total,
    @Default(20) int limit,
    bool? isCreated,
    bool? isUpdated,
    bool? isDeleted,
    int? statusCode,
    @Default({}) Map<String, dynamic> formData,
    @Default({}) Map<String, dynamic> updateFormState,
    @Default([]) List<String> bibleReaders,
    @Default([]) List<String> updateBibleReaders,
    @Default([]) List<ChurchService> churchServices,
    ChurchService? churchService,
    ChurchService? selectedChurchService,
    UserEntity? user,
    SettingEntity? setting,
    String? errorMsg,
  }) = _HomeState;
}
