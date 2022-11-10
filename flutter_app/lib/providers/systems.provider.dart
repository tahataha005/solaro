import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/exception.model.dart';
import 'package:flutter_app/providers/system.provider.dart';
import 'package:flutter_app/tools/request.dart';

class Systems with ChangeNotifier {
  List<System> systems = [];

  List<System> get getSystems {
    return [...systems];
  }

  Future addSystem(
      String userId, String name, String connection, context) async {
    try {
      final response = await sendRequest(
          method: "POST",
          route: "/control/system",
          load: {
            "user_id": userId,
            "system_name": name,
            "connection": connection,
          },
          context: context);
      if (response["message"] != null) {
        throw HttpException(response["message"]);
      }

      System newSystem = System(
        name: name,
        connection: connection,
        consumption: 0,
        charging: 0,
        items: [],
      );
      systems.add(newSystem);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future loadSystems(List fetchedSystems) async {
    for (Map system in fetchedSystems) {
      System newSystem = System(
        id: system["_id"],
        name: system["name"],
        connection: system["connection"],
        consumption: system["consumption"].toDouble(),
        charging: system["charging"].toDouble(),
        items: system["items"],
      );

      systems.add(newSystem);
    }
    notifyListeners();
  }
}
