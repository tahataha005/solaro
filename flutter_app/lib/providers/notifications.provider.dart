import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/notifications.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notifications with ChangeNotifier {
  List notifications = [];
  bool showNotifications = true;

  bool get getShowNotifications => showNotifications;

  void setShowNotifications(bool value) async {
    showNotifications = value;
    print(showNotifications);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showNotifications', value);
    notifyListeners();
  }

  List get getNotifications {
    return notifications;
  }

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

  void loadNotifications(notifications) {
    for (var notification in notifications) {
      addNotification(
          notification["title"], notification["body"], notification["time"]);
      print(notification);
    }
  }

  void emptyNotifications() {
    notifications = [];
    notifyListeners();
  }
}
