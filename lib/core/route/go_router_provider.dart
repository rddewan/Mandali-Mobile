import 'package:account/account.dart';
import 'package:church/church.dart';
import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/ui/phone_auth_screen.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/ui/phone_otp_screen.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/ui/update_display_name_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home/home.dart';
import 'package:mandali/core/route/route_name.dart';
import 'package:member/member.dart';
import 'package:setting/setting.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');

typedef ProductReviewPageData = (
  String sku,
  String urlKey,
  ProductType productType,
);

final goRouterProvider = Provider<GoRouter>((ref) {
  bool isDuplicate = false;
  final notifier = ref.read(goRouterNotifierProvider);
  final observer = ref.read(routeObserverProvider);
  final navigatorObserver = ref.read(appNavigatorObserverObserverProvider);
  final logger = ref.read(loggerProvider('GoRouter'));
  final secureStorage = ref.watch(secureStorageProvider);

  return GoRouter(
    restorationScopeId: 'router',
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    refreshListenable: notifier,
    observers: [observer, navigatorObserver],
    redirect: (context, state) async {
      logger.info('matchedLocation: ${state.matchedLocation}');
      logger.info('name: ${state.name}');
      logger.info('path: ${state.path}');
      logger.info('fullPath: ${state.fullPath}');

      final accessToken = await secureStorage.read(accessTokenKey);
      final isLoggedIn = accessToken == null ? false : true;
      final isGoingToLogin = state.matchedLocation == '/login';
      final isGoingToPhoneAuth = state.matchedLocation == '/login/phoneAuth';
      final isGoingToOTP = state.matchedLocation == '/login/phoneOTP';

      if (!isDuplicate) {
        if (isLoggedIn) {
          if (isGoingToLogin || isGoingToOTP || isGoingToPhoneAuth) {
            isDuplicate = true;
            return '/';
          }
        } else {
          if (!isGoingToLogin && !isGoingToOTP && !isGoingToPhoneAuth) {
            isDuplicate = true;
            return '/login?from=${state.matchedLocation}';
          } else {
            return null;
          }
        }
      }

      if (isDuplicate) {
        isDuplicate = false;
      }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/login',
        name: loginRoute,
        pageBuilder: (context, state) {
          //final from = state.uri.queryParameters['from'];
          return NoTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: SelectChurchScreen(
              key: state.pageKey,
            ),
          );
        },
        routes: [
          GoRoute(
            path: phoneAuthRoute,
            name: phoneAuthRoute,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: PhoneAuthScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: 'phoneOTP',
            name: phoneOTPRoute,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: PhoneOTPScreen(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: 'updateName',
            name: updateName,
            builder: (context, state) {
              return UpDateDisplayName(
                key: state.pageKey,
              );
            },
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardScreen(
            key: state.pageKey,
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          // 1st - The route branch for the category tab of the bottom navigation bar.
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: '/',
                  name: homeRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      key: state.pageKey,
                      name: state.name,
                      child: HomeScreen(
                        key: state.pageKey,
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: createChurchServiceRoute,
                      name: createChurchServiceRoute,
                      pageBuilder: (context, state) {
                        return CustomTransitionPage(
                          key: state.pageKey,
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) =>
                              SlideTransition(
                            position: animation.drive(Tween<Offset>(
                              begin: const Offset(0.8, 0.8),
                              end: Offset.zero,
                            ).chain(CurveTween(curve: Curves.easeIn))),
                            child: child,
                          ),
                          child: CreateChurchServiceScreen(
                            key: state.pageKey,
                          ),
                        );
                      },
                    ),
                    GoRoute(
                      path: '$editChurchServiceRoute/:id',
                      name: editChurchServiceRoute,
                      pageBuilder: (context, state) {
                        final id = state.pathParameters['id'] ?? '';
                        return CustomTransitionPage(
                          key: state.pageKey,
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 500),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) =>
                              SlideTransition(
                            position: animation.drive(Tween<Offset>(
                              begin: const Offset(0.8, 0.8),
                              end: Offset.zero,
                            ).chain(CurveTween(curve: Curves.easeIn))),
                            child: child,
                          ),
                          child: EditChurchServiceScreen(
                            key: state.pageKey,
                            id: int.parse(id),
                          ),
                        );
                      },
                    ),
                    GoRoute(
                      path: '$churchServiceDetailRoute/:id',
                      name: churchServiceDetailRoute,
                      pageBuilder: (context, state) {
                        final id = state.pathParameters['id'] ?? '';
                        return CustomTransitionPage(
                          key: state.pageKey,
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 500),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) =>
                              SlideTransition(
                            position: animation.drive(Tween<Offset>(
                              begin: const Offset(0.8, 0.8),
                              end: Offset.zero,
                            ).chain(CurveTween(curve: Curves.easeIn))),
                            child: child,
                          ),
                          child: ChurchServiceDetailScreen(
                            key: state.pageKey,
                            id: int.parse(id),
                          ),
                        );
                      },
                    ),
                  ]),
            ],
          ),

          // 2st - The route branch for the category tab of the bottom navigation bar.
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: '/$memberRoute',
                  name: memberRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      key: state.pageKey,
                      name: state.name,
                      child: MemberScreen(
                        key: state.pageKey,
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: '$memberDetailRoute/:id',
                      name: memberDetailRoute,
                      pageBuilder: (context, state) {
                        final id = state.pathParameters['id'] ?? '';
                        return CustomTransitionPage(
                          key: state.pageKey,
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 500),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) =>
                              SlideTransition(
                            position: animation.drive(Tween<Offset>(
                              begin: const Offset(0.8, 0.8),
                              end: Offset.zero,
                            ).chain(CurveTween(curve: Curves.easeIn))),
                            child: child,
                          ),
                          child: MemberDetailScreen(
                            key: state.pageKey,
                            id: int.parse(id),
                          ),
                        );
                      },
                    ),
                  ]),
            ],
          ),

          // 3st - The route branch for the category tab of the bottom navigation bar.
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/$accountRoute',
                name: accountRoute,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    key: state.pageKey,
                    name: state.name,
                    child: AccountScreen(
                      key: state.pageKey,
                    ),
                  );
                },
              ),
            ],
          ),

          // 4th - The route branch for the category tab of the bottom navigation bar.
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: '/$settingRoute',
                  name: settingRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                      key: state.pageKey,
                      name: state.name,
                      child: SettingScreen(
                        key: state.pageKey,
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: languageRoute,
                      name: languageRoute,
                      pageBuilder: (context, state) {
                        return CustomTransitionPage(
                          key: state.pageKey,
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 500),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  SlideTransition(
                            position: animation.drive(Tween<Offset>(
                              begin: const Offset(0.8, 0.8),
                              end: Offset.zero,
                            ).chain(CurveTween(curve: Curves.easeIn))),
                            child: child,
                          ),
                          child: LanguagePickerScreen(
                            key: state.pageKey,
                          ),
                        );
                      },
                    ),
                    GoRoute(
                      path: themeRoute,
                      name: themeRoute,
                      pageBuilder: (context, state) {
                        return CustomTransitionPage(
                          key: state.pageKey,
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 500),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  SlideTransition(
                            position: animation.drive(Tween<Offset>(
                              begin: const Offset(0.8, 0.8),
                              end: Offset.zero,
                            ).chain(CurveTween(curve: Curves.easeIn))),
                            child: child,
                          ),
                          child: ThemePickerScreen(
                            key: state.pageKey,
                          ),
                        );
                      },
                    )
                  ]),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => NoRouteScreen(
      key: state.pageKey,
    ),
  );
});
