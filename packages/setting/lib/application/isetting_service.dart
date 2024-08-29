import 'package:common/common.dart';
import 'package:core/local/db/entity/setting_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IsettingService {
  Future<Result<SettingEntity, Failure>> readSetting();

  Future<Result<bool, Failure>> writeSetting(SettingEntity setting);

  Future<void> getChurchSetting();
}
