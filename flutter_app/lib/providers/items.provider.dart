import 'package:flutter/cupertino.dart';
import 'package:flutter_app/providers/item.provider.dart';
import 'package:flutter_app/tools/request.dart';

class Items with ChangeNotifier {
  List<Item> _items = [
    Item(
      item_name: "Refrigerator",
      ideal_consumption: 3,
      live_consumption: 2.8,
      status: true,
    ),
    Item(
      item_name: "Lights",
      ideal_consumption: 1.5,
      live_consumption: 1.4,
      status: true,
    ),
    Item(
      item_name: "Dryer",
      ideal_consumption: 100,
      live_consumption: 101,
      status: true,
    ),
    Item(
      item_name: "TV",
      ideal_consumption: 4.5,
      live_consumption: 0,
      status: false,
    ),
    Item(
      item_name: "Heater",
      ideal_consumption: 2,
      live_consumption: 0,
      status: false,
    ),
  ];

  List<Item> get items {
    return [..._items];
  }

  Item findByName(name) {
    return items.firstWhere((item) => item.item_name == name);
  }

  Future addItem(userId, name, idealConsumption, context) async {
    try {
      final response = await sendRequest(
          route: "/control/item",
          method: "POST",
          load: {
            "user_id": userId,
            "system_id": "6366a047cb1d6bcd80ef72f4",
            "name": name,
            "ideal_consumption": idealConsumption,
          },
          context: context);
      print(response);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}
