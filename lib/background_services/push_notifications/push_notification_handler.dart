import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learning_flutter/background_services/push_notifications/notification_constans.dart';


Future<void> pushNotification({required String token, required String content}) async {
  try {
    await http.post(
      Uri.parse(NotificationsConstants.firebaseMessagingUri),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
        'key=${NotificationsConstants.firebaseMessagingKey}',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'sound': 'default',
            'body': 'bodyyy',
            'title': 'title'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'type': 'Alert',
            'content': content.isEmpty?'Welcome in Notification app ':content,
            'status': 'done'
          },
          "to": token,
        },
      ),
    );
  } catch (e) {
    print("error push notification");
  }
}

