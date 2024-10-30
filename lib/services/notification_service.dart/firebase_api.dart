import 'dart:convert';
import 'dart:developer';

import 'package:eagro/main.dart';
import 'package:eagro/screens/testscreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import '../../providers/main_provider.dart';
import '../../screens/orders_screen/orders_providers/order_provider.dart';
import '../../screens/orders_screen/orders_screen.dart';


class FirebaseApi {
  static BuildContext? context;

  final firebaseMessaging = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
    "high_importance_channel",
    "High Importance Notifications",
    description: "This channel is used for import notifications",
    importance: Importance.defaultImportance,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    final fCMToken = await firebaseMessaging.getToken();
    log('--------------------------DEV LOG--------------------------');
    log('--------------------------$fCMToken--------------------------');
    await initPushNotifications();
    // await initLocalNotifications();
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    // print(message.notification?.title ?? "");
    // print(message.notification?.body ?? "");
    // print(message.data);
  }

  Future<void> handleMessage1(RemoteMessage? message) async {
   log('------------------11111111111--------DEV LOG---------------SASA--1111111---------');
    log('------${navigatorKey.currentState}-------------11111111------DEV LOG--111111----------------SASA--------');

    if (message == null) return;

    log(message.notification?.title ?? "");
    log(message.notification?.body ?? "");
  }
  Future<void> handleMessage2(RemoteMessage? message) async {
   log('--------------22222222222222222------------DEV LOG---------------SASA-----------');
    log('------${navigatorKey.currentState}------------2222222--------DEV LOG------222222222------------SASA--------');

    if (message == null) return;

    log(message.notification?.title ?? "");
    log(message.notification?.body ?? "");
  }
   handleMessage3(RemoteMessage? message)  {
final mainProvider = Provider.of<MainProvider>(context!, listen: false);
 Navigator.of(context!).push(
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (context) => OrdersProvider(
                        userId: mainProvider.getId(),
                        isShop: mainProvider.isShop(),
                      ),
                      child: const OrdersScreen(),
                    ),
                  ),
                );

   log('--------------3333333333------------DEV LOG---------333333333------SASA-----------');
    log('------${navigatorKey.currentState}-----------3333333---------DEV LOG----33333333--------------SASA--------');

    if (message == null) return;

    log(message.notification?.title ?? "");
    log(message.notification?.body ?? "");
  }

  Future initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);

    // await _localNotifications.initialize(
    //   settings,
    //   onDidReceiveNotificationResponse: (details) {
    //     log('--------------1111111111111111111111111------------DEV LOG--------------------------');
    //     final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
    //     handleMessage1(message);
    //   },
    // );
    // final platform = _localNotifications.resolvePlatformSpecificImplementation<
    //     AndroidFlutterLocalNotificationsPlugin>();

    // await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );


    
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage2);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage3);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (message) {
        final notification = message.notification;
        if (notification == null) return;
        _localNotifications.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                _androidChannel.id,
                _androidChannel.name,
                channelDescription: _androidChannel.description,
                icon: '@drawable/ic_launcher',
              ),
            ),
            payload: jsonEncode(message.toMap()));
      },
    );
  }
}
