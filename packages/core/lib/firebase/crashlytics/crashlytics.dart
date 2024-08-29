part of core;

final crashlyticsProvider = Provider.autoDispose<Crashlytics>((ref) {
  ref.cacheFor(const Duration(seconds: 60));

  final crashlytics = ref.watch(firebaseCrashlyticsProvider);

  return Crashlytics(crashlytics);
});

class Crashlytics {
  final FirebaseCrashlytics _crashlytics;

  Crashlytics(this._crashlytics) {
    _init();
  }

  /// Enables/disables automatic data collection by Crashlytics.
  void _init() async {
    if (kDebugMode) {
      await _crashlytics.setCrashlyticsCollectionEnabled(false);
    } else {
      await _crashlytics.setCrashlyticsCollectionEnabled(true);
    }
  }

  /// Records a user ID (identifier) that's associated with subsequent fatal and non-fatal reports.
  Future<void> setUser(String user) async {
    await _crashlytics.setUserIdentifier(user);
  }

  Future<void> nonFatalCrash({
    required dynamic exception,
    StackTrace? stack,
    String? reason,
  }) async {
    if (_crashlytics.isCrashlyticsCollectionEnabled) {
      await _crashlytics.recordError(
        exception,
        stack,
        reason: reason ?? 'Non_fatal Error',
      );
    }
  }

  Future<void> fatalCrash(FlutterErrorDetails flutterErrorDetails) async {
    if (_crashlytics.isCrashlyticsCollectionEnabled) {
      _crashlytics.recordFlutterFatalError(flutterErrorDetails);
    }
  }
}
