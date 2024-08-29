part of common;

extension GoRouterExtension on GoRouter {
  String get currentRoute =>
      routerDelegate.currentConfiguration.last.matchedLocation;
}
