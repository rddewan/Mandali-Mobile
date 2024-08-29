import 'dart:async';
import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mandali/main_widget.dart';
import 'package:mandali/start_up/start_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

FutureOr<void> mainApp(Flavor flavor) async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // When an error occurs while building a widget, the broken widget is
      // replaced by the widget returned by this function.
      // By default, an [ErrorWidget] is returned.
      ErrorWidget.builder = (FlutterErrorDetails error) {
        return FlutterErrorWidget(error: error);
      };

      // initialize firebase
      await Firebase.initializeApp();

      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError = (FlutterErrorDetails error) {
        //Submits a Crashlytics report of a fatal error caught by the Flutter framework.
        FirebaseCrashlytics.instance.recordFlutterFatalError;
      };

      // init the google fonts license
      LicenseRegistry.addLicense(() async* {
        final license = await rootBundle.loadString(
          'packages/common/google_fonts/OFL.txt',
        );
        yield LicenseEntryWithLineBreaks(['google_fonts'], license);
      });

      // test FirebaseCrashlytics setup
      //FirebaseCrashlytics.instance.crash();

      runApp(
        ProviderScope(
          child: RootRestorationScope(
            restorationId: 'root',
            child: StartUpScreen(
              flavor: flavor,
              builder: (context) => const MainWidget(),
            ),
          ),
        ),
      );
    },
    (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
    zoneValues: {'zone-name': 'main'},
  );
}
