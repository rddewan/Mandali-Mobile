part of core;

final remoteConfigProvider = Provider.autoDispose<RemoteConfig>((ref) {
  final remoteConfig = ref.watch(firebaseRemoteConfigProvider);

  return RemoteConfig(remoteConfig);
});

class RemoteConfig {
  RemoteConfig(this._remoteConfig) {
    _init();
  }

  final FirebaseRemoteConfig _remoteConfig;

  // init the firebase remote config
  void _init() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 60),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    // default values - you can add more key-value
    _remoteConfig.setDefaults(<String, dynamic>{
      'is_theme_enabled': false,
    });

    await _remoteConfig.fetchAndActivate();
  }

  bool getBool(String key) {
    return _remoteConfig.getBool(key);
  }

  String getString(String key) {
    return _remoteConfig.getString(key);
  }

  int getInt(String key) {
    return _remoteConfig.getInt(key);
  }

  double getDouble(String key) {
    return _remoteConfig.getDouble(key);
  }
}
