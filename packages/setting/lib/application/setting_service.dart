import 'package:common/common.dart';
import 'package:core/local/db/entity/setting_entity.dart';
import 'package:setting/application/isetting_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setting/data/repository/isetting_repository.dart';
import 'package:setting/data/repository/setting_repositroy.dart';
import 'package:multiple_result/multiple_result.dart';

final settingServiceProvider = Provider<IsettingService>((ref) {
  final settingRepository = ref.watch(settingRepositoryProvider);

  return SettingService(settingRepository);
});

final class SettingService implements IsettingService {
  final ISettingRepository _settingRepository;

  SettingService(this._settingRepository);

  @override
  Future<Result<SettingEntity, Failure>> readSetting() async {
    try {
      final result = await _settingRepository.readSetting();

      return Success(result);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<bool, Failure>> writeSetting(SettingEntity setting) async {
    try {
      await _settingRepository.writeSetting(setting);

      return const Success(true);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<void> getChurchSetting() async {
    try {
      await _settingRepository.getChurchSetting();
    } on Failure catch (_) {
      rethrow;
    }
  }
}
