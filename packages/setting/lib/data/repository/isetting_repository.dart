import 'package:core/local/db/entity/setting_entity.dart';

abstract interface class ISettingRepository {
  Future<void> writeSetting(SettingEntity setting);

  Future<SettingEntity> readSetting();

  Future<void> getChurchSetting();
}
