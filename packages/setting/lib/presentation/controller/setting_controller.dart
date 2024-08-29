import 'package:core/local/db/entity/setting_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setting/application/setting_service.dart';
import 'package:setting/presentation/state/setting_state.dart';

final settingControllerProvider =
    NotifierProvider<SettingController, SettingState>(SettingController.new);

final class SettingController extends Notifier<SettingState> {
  @override
  SettingState build() {
    return const SettingState();
  }

  Future<void> readSetting() async {
    state = state.copyWith(errorMsg: null);

    final service = ref.read(settingServiceProvider);

    final result = await service.readSetting();
    result.when(
      (success) {
        state = state.copyWith(
          language: success.language,
          themeMode: success.theme,
          timeZone: success.timeZone,
        );
      },
      (error) {
        state = state.copyWith(errorMsg: error.message);
      },
    );
  }

  Future<void> writeTheme(String theme) async {
    state = state.copyWith(errorMsg: null);
    final service = ref.read(settingServiceProvider);
    final entity = SettingEntity()
      ..language = state.language
      ..theme = theme;

    final result = await service.writeSetting(entity);
    result.when(
      (success) {
        state = state.copyWith(themeMode: theme);
      },
      (error) {
        state = state.copyWith(errorMsg: error.message);
      },
    );
  }

  Future<void> writeLanguage(String language) async {
    state = state.copyWith(errorMsg: null);

    final service = ref.read(settingServiceProvider);
    final entity = SettingEntity()
      ..language = language
      ..theme = state.themeMode;

    final result = await service.writeSetting(entity);
    result.when(
      (success) {
        state = state.copyWith(language: language);
      },
      (error) {
        state = state.copyWith(errorMsg: error.message);
      },
    );
  }

  Future<void> getChurchSetting() async {
    final service = ref.read(settingServiceProvider);
    await service.getChurchSetting();
  }
}
