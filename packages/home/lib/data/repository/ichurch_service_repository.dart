import 'package:core/local/db/entity/setting_entity.dart';
import 'package:core/local/db/entity/user_entity.dart';
import 'package:home/data/dto/church_service_response.dart';

abstract interface class IChurchServiceRepository {
  Future<ChurchServicesResponse> getChurchServices(
    Map<String, dynamic> queries,
  );

  Future<ChurchServiceResponse> getChurchService(String id);

  Future<ChurchServiceResponse> createChurchService(Map<String, dynamic> body);

  Future<ChurchServiceResponse> updateChurchService(Map<String, dynamic> body);

  Future<ChurchServiceResponse> deleteChurchService(String id);

  Future<UserEntity?> readUser();
  Future<SettingEntity?> readSetting();
}
