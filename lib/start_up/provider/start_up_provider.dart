import 'dart:async';

import 'package:account/presentation/controller/account_controller.dart';
import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:core/local/db/isar_db.dart';
import 'package:mandali/core/firebase/notification/firebase_push_notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:setting/presentation/controller/setting_controller.dart';
import 'package:timezone/data/latest.dart' as tz_latest;
import 'package:timezone/timezone.dart' as tz;

part 'start_up_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> startUp(StartUpRef ref, {required Flavor flavor}) async {
  ref.onDispose(() {
    ref.invalidate(flavorProvider);
    ref.invalidate(performanceProvider);
    ref.invalidate(remoteConfigProvider);
    ref.invalidate(setupLoggingProvider);
    ref.invalidate(crashlyticsProvider);
    ref.invalidate(envReaderProvider);
    ref.invalidate(settingControllerProvider);
  });

  // Set the flavor state
  ref.read(flavorProvider.notifier).state = flavor;

  // setup the firebase performance
  final performance = ref.read(performanceProvider);
  final trace = performance.getTrace('StartUp');
  // start trace performance
  trace.start();

  // remote config
  ref.read(remoteConfigProvider);
  // Setup Logger
  ref.read(setupLoggingProvider);
  // Enables/disables automatic data collection by Crashlytics.
  ref.read(crashlyticsProvider);

  // initialize Time Zone database from latest
  tz_latest.initializeTimeZones();
  final location = tz.getLocation('Asia/Kolkata');
  tz.setLocalLocation(location);

  // open isar db
  final isarDb = ref.read(isarDbProvider);
  await isarDb.openDb();

  // read access token from secure storage
  final secureStorage = ref.read(secureStorageProvider);
  final accessToken = await secureStorage.read(accessTokenKey);
  // check if token is not null
  if (accessToken != null) {
    // if access token is not null, get user profile
    ref.read(accountControllerProvider.notifier).me();
  }

  // firebase push notification
  ref.read(firebasePushNotificationProvider);
  // read app setting
  ref.read(settingControllerProvider.notifier).readSetting();

  // stop trace
  trace.stop();
}
