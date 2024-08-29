part of core;

final firebasePerformanceProvider =
    Provider.autoDispose<FirebasePerformance>((ref) {
  ref.cacheFor(const Duration(seconds: 60));
  return FirebasePerformance.instance;
});
