part of core;

final firebaseCrashlyticsProvider =
    Provider.autoDispose<FirebaseCrashlytics>((ref) {
  ref.cacheFor(const Duration(seconds: 60));
  return FirebaseCrashlytics.instance;
});
