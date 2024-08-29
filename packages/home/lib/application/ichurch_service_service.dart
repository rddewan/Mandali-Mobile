import 'package:common/common.dart';
import 'package:core/local/db/entity/setting_entity.dart';
import 'package:core/local/db/entity/user_entity.dart';
import 'package:home/domain/church_service_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IchurchServiceService {
  Future<Result<ChurchServiceModel, Failure>> getChurchServices(
    Map<String, dynamic> queries,
  );

  Future<Result<ChurchService, Failure>> getChurchService(String id);

  Future<Result<ChurchService, Failure>> createChurchService(
    Map<String, dynamic> body,
  );

  Future<Result<ChurchService, Failure>> updateChurchService(
    Map<String, dynamic> body,
  );

  Future<Result<ChurchService, Failure>> deleteChurchService(String id);

  Future<Result<UserEntity?, Failure>> readUser();

  Future<Result<SettingEntity?, Failure>> readSetting();
}
