import 'package:firebase_messaging/firebase_messaging.dart';

class MyNotification {
  static Future getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      print("token: $token");
    });
  }
}
