import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/exception.model.dart';
import 'package:flutter_app/providers/system.provider.dart';
import 'package:flutter_app/tools/request.dart';

class Systems extends ChangeNotifier {
  List<System> systems = [];

  List<System> get getSystems {
    return [...systems];
  }

  Future addSystem(String userId, System system, context) async {
    try {
      final response = await sendRequest(
          method: "POST",
          route: "/control/system",
          load: {
            "user_id": userId,
            "system_name": system.name,
            "connection": system.connection,
          },
          context: context);
      if (response["message"] != null) {
        throw HttpException(response["message"]);
      }
      systems.add(system);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
