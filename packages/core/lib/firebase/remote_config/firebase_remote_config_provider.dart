part of core;

final firebaseRemoteConfigProvider =
    Provider.autoDispose<FirebaseRemoteConfig>((ref) {
  return FirebaseRemoteConfig.instance;
});
