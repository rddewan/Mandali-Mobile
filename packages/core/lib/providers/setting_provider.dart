part of core;

final settingProvider = StreamProvider<SettingEntity?>((ref) async* {
  final isar = ref.watch(isarDbProvider).isar;
  final settingStream =
      isar?.settingEntitys.watchObject(1, fireImmediately: true);

  yield* settingStream ?? Stream.value(SettingEntity());
});
