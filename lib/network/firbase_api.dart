import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ydcpl_application/main.dart';

Future<void> handleBackGroundMessage(RemoteMessage message) async {
  print("Title : ${message.notification?.title}");
  print("Body : ${message.notification?.body}");
  print("Payload : ${message.data}");
}

class FireBaseApi {
  final firebasemessaging = FirebaseMessaging.instance;
  final androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notification',
      description: 'this channel is used for important notification',
      importance: Importance.defaultImportance);
  final _localNotification = FlutterLocalNotificationsPlugin();
  @pragma('vm:entry-point')
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    // navigatorKey.currentState?.pushNamed(NotificationsScreen.route, arguments:
    // message);
  }

  ///

  Future initLocalNotifications() async {
    const iOS = IOSInitializationSettings();
    const android = AndroidInitializationSettings('@mipmap/launcher_icon');
    const settings = InitializationSettings(android: android, iOS: iOS);
    await _localNotification.initialize(settings,
        onSelectNotification: (payload) {
      final message = RemoteMessage.fromMap(
        jsonDecode(payload!),
      );
      handleMessage(message);
    });
    final platform = _localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(androidChannel);
  }

  ///////////////////
  Future<void> initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((handleBackGroundMessage) {});
    FirebaseMessaging.onMessageOpenedApp.listen(handleBackGroundMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);

    FirebaseMessaging.onMessage.listen((message) async {
      print("this is the main file");
      print(message.data);
      @pragma('vm:entry-point')
      final notification = message.notification;
      if (notification == null) return;
      // _showNotification();
      if (message.data["notification_type"] == "custom") {
        final http.Response response =
            await http.get(Uri.parse(message.data["notificaton_image"]));
        BigPictureStyleInformation bigPictureStyleInformation =
            BigPictureStyleInformation(
          ByteArrayAndroidBitmap.fromBase64String(
              base64Encode(response.bodyBytes)),
          largeIcon: ByteArrayAndroidBitmap.fromBase64String(
              base64Encode(response.bodyBytes)),
        );
        // _showNotification();
        _localNotification.show(
            notification.hashCode,
            notification.title,
            notification.body,
            // notification.
            NotificationDetails(
                android: AndroidNotificationDetails(
                    androidChannel.id, androidChannel.name,
                    channelDescription: androidChannel.description,
                    styleInformation: bigPictureStyleInformation,
                    icon: '@mipmap/launcher_icon')),
            payload: jsonEncode(message.toMap()));
      } else {
        _localNotification.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                    androidChannel.id, androidChannel.name,
                    channelDescription: androidChannel.description,
                    // styleInformation: BigPictureStyleInformation(
                    //   FilePathAndroidBitmap('assets/images/dash.png'),
                    //   contentTitle: notification.title,
                    //   hideExpandedLargeIcon: false,
                    //   summaryText: notification.body,
                    // ),
                    icon: '@mipmap/launcher_icon')),
            payload: jsonEncode(message.toMap()));
      }
    });
  }

  Future<void> initNotification() async {
    await firebasemessaging.requestPermission();
    fcmToken = await firebasemessaging.getToken();
    log("FcmToken : $fcmToken");
    initPushNotification();
    initLocalNotifications();
    // initPushNotifications();
  }
}
