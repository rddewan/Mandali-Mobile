part of core;

final performanceProvider = Provider.autoDispose<Performance>((ref) {
  ref.cacheFor(const Duration(seconds: 60));

  final firebasePerformance = ref.watch(firebasePerformanceProvider);

  return Performance(firebasePerformance);
});

class Performance {
  final FirebasePerformance _firebasePerformance;

  Performance(this._firebasePerformance) {
    _init();
  }

  void _init() {
    if (kDebugMode) {
      // Enables or disables custom performance monitoring setup.
      _firebasePerformance.setPerformanceCollectionEnabled(false);
    } else {
      _firebasePerformance.setPerformanceCollectionEnabled(true);
    }
  }

  /// Creates a [Trace] object with given [name]. Traces can be used to measure
  /// the time taken for a sequence of steps. Traces also include “Counters”.
  /// Counters are used to track information which is cumulative in nature
  /// (e.g., Bytes downloaded).
  ///
  /// The [name] requires no leading or trailing whitespace, no leading
  /// underscore _ character, and max length of [Trace.maxTraceNameLength]
  /// characters.
  Trace getTrace(String name) {
    return _firebasePerformance.newTrace(name);
  }

  /// Creates a HttpMetric object for collecting network performance data
  /// for one request/response. Only works for native apps.
  /// A stub class is created for web which does nothing
  /// @param url The url to which the request is sent
  /// @param httpMethod The http method used for the request [Connect, Delete, Get, Head, Options, Patch, Post, Put, Trace]
  HttpMetric httpMetric({required String url, required HttpMethod httpMethod}) {
    return _firebasePerformance.newHttpMetric(url, httpMethod);
  }
}
