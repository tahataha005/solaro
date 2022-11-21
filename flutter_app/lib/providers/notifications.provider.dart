import 'package:flutter/foundation.dart';

class Notifications with ChangeNotifier {
  List notifications = [];

  List get getNotifications {
    return notifications;
  }
}
