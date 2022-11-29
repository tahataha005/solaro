import 'package:flutter/cupertino.dart';
import '../models/exception.model.dart';
import '../providers/system.provider.dart';
import '../tools/request.dart';

class Systems with ChangeNotifier {
  List<System> systems = [];

  List<System> get getSystems {
    return [...systems];
  }

  //Creating new system
  Future addSystem(
    String userId,
    String name,
    double capacitance,
    String chargingPin,
    String consumptionPin,
    context,
  ) async {
    try {
      final response = await sendRequest(
        method: "POST",
        route: "/control/system",
        load: {
          "user_id": userId,
          "system_name": name,
          "chargingPin": chargingPin,
          "consumptionPin": consumptionPin,
          "capacity": capacitance,
        },
        context: context,
      );

      if (response["message"] != null) {
        throw HttpException(response["message"]);
      }

      System newSystem = System(
        id: response["added"]["_id"],
        name: name,
        chargingPin: chargingPin,
        consumptionPin: consumptionPin,
        capacitance: capacitance,
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

  //Get all systems
  Future loadSystems(List fetchedSystems) async {
    for (Map system in fetchedSystems) {
      System newSystem = System(
        id: system["_id"].toString(),
        name: system["name"],
        chargingPin: system["chargingPin"],
        capacitance: system["capacity"].toDouble(),
        consumptionPin: system["consumptionPin"],
        consumption: 0,
        charging: 0,
        items: system["items"],
      );

      systems.add(newSystem);
    }
    notifyListeners();
  }

  //Empty systems list
  void emptySystems() {
    systems = [];
    notifyListeners();
  }
}
