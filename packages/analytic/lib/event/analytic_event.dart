part of analytic;

sealed class AnalyticEvent {}

class AppOpenEvent extends AnalyticEvent {}

class AddToCartEvent extends AnalyticEvent {
  List<AnalyticsEventItem>? items;
  double? value;
  String? currency;
  Map<String, Object>? parameters;
  AnalyticsCallOptions? callOptions;

  AddToCartEvent({
    this.items,
    this.value,
    this.currency,
    this.parameters,
    this.callOptions,
  });
}

class PageViewEvent extends AnalyticEvent {
  final String page;
  PageViewEvent({required this.page});
}

class UserActionEvent extends AnalyticEvent {
  final String name;
  Map<String, Object> params;

  UserActionEvent({required this.name, required this.params});
}

class AddToWishList extends AnalyticEvent {
  List<AnalyticsEventItem>? items;
  double? value;
  String? currency;
  Map<String, Object>? parameters;
  AnalyticsCallOptions? callOptions;

  AddToWishList({
    this.items,
    this.value,
    this.currency,
    this.parameters,
    this.callOptions,
  });
}
