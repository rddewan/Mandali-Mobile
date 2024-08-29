part of analytic;

final analyticServiceProvider = Provider.autoDispose<AnalyticService>((ref) {
  final analytics = ref.watch(firebaseAnalyticsProvider);

  return AnalyticService(analytics: analytics);
});

class AnalyticService {
  final FirebaseAnalytics _firebaseAnalytics;

  AnalyticService({
    required FirebaseAnalytics analytics,
  }) : _firebaseAnalytics = analytics;

  void eventListener(Stream<AnalyticEvent> event) {
    event.listen((event) async {
      switch (event) {
        case PageViewEvent():
          await _firebaseAnalytics.logScreenView(screenName: event.page);
          break;
        case UserActionEvent():
          await _firebaseAnalytics.logEvent(
            name: event.name,
            parameters: event.params,
          );
          break;
        case AppOpenEvent():
          await _firebaseAnalytics.logAppOpen();
          break;
        case AddToCartEvent():
          await _firebaseAnalytics.logAddToCart(
            parameters: event.parameters,
            currency: event.currency,
            value: event.value,
            items: event.items,
          );
          break;
        case AddToWishList():
          await _firebaseAnalytics.logAddToWishlist(
            parameters: event.parameters,
            currency: event.currency,
            value: event.value,
            items: event.items,
          );
          break;
      }
    });
  }
}
