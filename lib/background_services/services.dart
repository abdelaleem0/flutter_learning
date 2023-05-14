import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:learning_flutter/background_services/push_notifications/push_notification_handler.dart';
String? token;
/// call Function [initializeService] in Main to initialize [FlutterBackgroundService]
Future<void> initializeService() async {
  await Firebase.initializeApp().then((value) async {
    final service = FlutterBackgroundService();

    ///this [my_foreground60] must change if you want to use this code
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'my_foreground60', // id
      'MY FOREGROUND SERVICE', // title
      description:
      'This channel is used for important notifications.', // description
      importance: Importance.low, // importance must be at low or higher level
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    /// this configure will always appear in notification bar
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
        ///this [notificationChannelId] must change if you want use to this code
        notificationChannelId: 'my_foreground60',
        initialNotificationTitle: 'NOTIFICATION SERVICE',
        initialNotificationContent: 'WORKING',
        foregroundServiceNotificationId: 888,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: onStart,
        onBackground: onIosBackground,
      ),
    );
    /// after put configure you must start Service
    service.startService();
    return null;
  });
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  await Firebase.initializeApp();
  token = await FirebaseMessaging.instance.getToken();

  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  pushNotificationsAutomatic(service);
}

/// function [pushNotificationsAutomatic] will work always in [background] and [foreground]
/// put your logic here
void pushNotificationsAutomatic(ServiceInstance service) {
  Timer.periodic(const Duration(seconds: 120), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        await pushNotification(
            token: await FirebaseMessaging.instance.getToken() ?? '',
            content: "HELLO");
      }
    }

    final deviceInfo = DeviceInfoPlugin();
    String? device;
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model;
    }

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.model;
    }

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": device,
      },
    );
  });
}
