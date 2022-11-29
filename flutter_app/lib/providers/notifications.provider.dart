import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/notifications.model.dart';

class Notifications with ChangeNotifier {
  List notifications = [];
  bool showNotifications = true;

  bool get getShowNotifications => showNotifications;

  List get getNotifications {
    return notifications;
  }

  //Setting show notifications
  void setShowNotifications(bool value) async {
    showNotifications = value;

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showNotifications', value);
    notifyListeners();
  }

  //Creating a new notifications
  void addNotification(title, body, time) {
    final newNotification = Notification(
      system_name: title.split(":")[0],
      title: title.split(":")[1],
      content: body,
      time: time,
    );
    notifications.add(newNotification);

    notifyListeners();
  }

  //Getting all notifications
  void loadNotifications(notifications) {
    for (var notification in notifications) {
      addNotification(
          notification["title"], notification["body"], notification["time"]);
    }
  }

  //Emptying notifications list
  void emptyNotifications() {
    notifications = [];
    notifyListeners();
  }
}
