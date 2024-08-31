import 'dart:io';

import 'package:analytic/analytic.dart';
import 'package:common/common.dart';
import 'package:common/i18n/translations.dart';
import 'package:common/theme/theme.dart';
import 'package:common/theme/theme_mode.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:mandali/core/route/go_router_provider.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:upgrader/upgrader.dart';

class MainWidget extends ConsumerStatefulWidget {
  const MainWidget({super.key});

  @override
  ConsumerState createState() => _MainWidgetState();
}

class _MainWidgetState extends ConsumerState<MainWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(eventManagerProvider).onEvent(AppOpenEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    // riverpod watch - gorouter
    final router = ref.watch(goRouterProvider);
    // setting
    final setting = ref.watch(settingProvider).value;

    // Theme
    final theme = ref.watch(materialThemeProvider(context));

    return StyledToast(
      locale: Locale(setting?.language ?? 'en'),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'main',
        title: 'Mandali',
        routerConfig: router,
        theme: theme.light(),
        darkTheme: theme.dark(),
        themeMode: currentTheme(setting?.theme),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocales.supportedLocales,
        locale: Locale(setting?.language ?? 'en'),
        localeResolutionCallback: (locale, supportedLocales) {
          for (var element in supportedLocales) {
            if (element.languageCode == locale?.languageCode) {
              return element;
            }
          }
          return Locale(setting?.language ?? 'en');
        },
        builder: (context, child) {
          return UpgradeAlert(
            shouldPopScope: () => true,
            navigatorKey: router.routerDelegate.navigatorKey,
            dialogStyle: Platform.isIOS
                ? UpgradeDialogStyle.cupertino
                : UpgradeDialogStyle.material,
            upgrader: Upgrader(
              messages: UpgraderTranslationMessages(
                code: setting?.language ?? 'en',
              ),
            ),
            child: LoaderOverlay(
              useDefaultLoading: false,
              overlayColor: Colors.transparent,
              overlayWidgetBuilder: (_) => const BaseLoadingIndicator(),
              child: child!,
            ),
          );
        },
      ),
    );
  }
}
