import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:common/common.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:go_router/go_router.dart';

import 'package:mandali/core/firebase/notification/flutter_local_notification_provider.dart';
import 'package:mandali/core/firebase/notification/model/received_notification.dart';
import 'package:mandali/core/route/go_router_provider.dart';

final localPushNotificationProvider = Provider<LocalPushNotification>((ref) {
  final localNotificationsPlugin = ref.watch(flutterLocalNotificationProvider);
  final logger = ref.watch(loggerProvider('LocalPushNotification'));
  final goRouter = ref.watch(goRouterProvider);

  return LocalPushNotification(localNotificationsPlugin, logger, goRouter);
});

class LocalPushNotification {
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin;
  final Logger _logger;
  final GoRouter _goRouter;

  LocalPushNotification(
    this._localNotificationsPlugin,
    this._logger,
    this._goRouter,
  ) {
    _init();
  }

  void _init() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('ic_notification'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestCriticalPermission: false,
        requestSoundPermission: false,
      ),
    );

    // request notification permission on Android 13 and above
    final isGranted = await _localNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission() ??
        false;

    _logger.info('is Android Notification Permission Granted: $isGranted');

    // Creates a notification channel.
    // This method is only applicable to Android versions 8.0 or newer.
    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_notificationChannelMax());

    // Initializes the plugin.
    // Call this method on application before using the plugin further.
    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        _logger.info(details.toString());
        _handleMessage(details.payload);
      },
    );
  }

  ///On Android, notification messages are sent to Notification
  ///Channels which are used to control how a notification is delivered.
  ///The default FCM channel used is hidden from users, however provides a "default" importance level.
  ///Heads up notifications require a "max" importance level.
  void showNotification(ReceivedNotification message) async {
    //final String largeIcon = await _base64EncodedImage(message.imageUrl ?? '');
    String? bigPicture;
    // check if the message contains an image
    if (message.imageUrl != null) {
      bigPicture = await _base64EncodedImage(message.imageUrl ?? '');
    }

    await _localNotificationsPlugin.show(
      message.id,
      message.title,
      message.body,
      NotificationDetails(
        android: _androidNotificationDetail(
          bigPicture != null
              ? BigPictureStyleInformation(
                  ByteArrayAndroidBitmap.fromBase64String(bigPicture),
                )
              : null,
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      payload: message.payload,
    );
  }

  // Asynchronous function that takes a URL as input and returns a base64 encoded image string.
  Future<String> _base64EncodedImage(String url) async {
    final response = await Dio().get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    final String base64Data = base64Encode(response.data ?? []);
    return base64Data;
  }

  // Generates Android notification details based on the provided style information.
  AndroidNotificationDetails _androidNotificationDetail(
    StyleInformation? styleInformation,
  ) {
    return AndroidNotificationDetails(
      '1001',
      'General Notification',
      channelDescription: 'This is a general notification channel',
      importance: Importance.max,
      priority: Priority.max,
      channelShowBadge: true,
      styleInformation: styleInformation,
    );
  }

  // Creates and returns an Android notification channel with maximum importance.
  AndroidNotificationChannel _notificationChannelMax() {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    return channel;
  }

  // Handle the given message payload, which is a nullable String.
  // It decodes the payload into a Map and checks if the 'link' key is present.
  // If it is, it retrieves the link and navigates using the _goRouter.
  void _handleMessage(String? payload) {
    final Map<String, dynamic> data = jsonDecode(payload ?? '');

    if (data['link'] != null) {
      final String link = data['link'];
      _goRouter.go(link);
    } else {
      _goRouter.go('/');
    }
  }
}
