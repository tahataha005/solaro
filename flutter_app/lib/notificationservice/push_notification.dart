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
          }
        },
      );
    }
  }
}
