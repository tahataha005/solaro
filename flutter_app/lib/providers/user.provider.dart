import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/exception.model.dart';
import '../providers/notifications.provider.dart';
import '../providers/systems.provider.dart';
import '../tools/request.dart';

class User with ChangeNotifier {
  String? email;
  String? userType;
  String? currentSystemId;

  String? get getCurrentSystemId {
    return currentSystemId;
  }

  String? get getEmail {
    return email;
  }

  //Setting current system
  void setCurrentSystemId(String systemId) {
    currentSystemId = systemId;
    notifyListeners();
  }

  //Get user data
  Future getUser(String id, context) async {
    try {
      final response = await sendRequest(route: "/read/$id", context: context);

      if (response["message"] != null) {
        throw HttpException(response["message"]);
      }

      email = response["email"];
      userType = response["user_type"];
      List systems = response["system"];
      List notifications = response["notifications"]?.toList() ?? [];

      Provider.of<Systems>(context, listen: false).loadSystems(systems);

      notifications.length != 0
          ? Provider.of<Notifications>(context, listen: false)
              .loadNotifications(notifications)
          : null;

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
