import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/notificationservice/local_notification_service.dart';

class PushNotification {
  static void pushNotification(context) {
    void getInitialMessage() {
      FirebaseMessaging.instance.getInitialMessage().then(
        (message) {
          print("FirebaseMessaging.instance.getInitialMessage");
          if (message != null) {
            print("New Notification");
            if (message.data['_id'] != null) {
              Navigator.of(context).pushNamed("/notifications");
            }
          }
        },
      );
    }

    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          final title = message.notification!.title;
          print(message.notification!.body);
          final body = message.notification!.body;
          print("message.data11 ${message.data}");
          final data = message.data;
          final hour = message.sentTime!.hour;
          final minute = message.sentTime!.minute;
          final time = "$hour:$minute";

          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
          Navigator.of(context).pushNamed("/notifications");
        }
      },
    );
  }
}
