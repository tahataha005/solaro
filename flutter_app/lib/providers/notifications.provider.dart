import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/notifications.model.dart';

class Notifications with ChangeNotifier {
  List notifications = [];

  List get getNotifications {
    return notifications;
  }

  void addNotification(title, body, data, time) {
    final newNotification = Notification(
      system_name: title.split(":")[0],
      title: title.split(":")[1],
      content: body,
      time: time,
    );
    notifications.add(newNotification);

    notifyListeners();
  }
}
