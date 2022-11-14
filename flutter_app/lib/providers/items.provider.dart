import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/exception.model.dart';
import 'package:flutter_app/providers/item.provider.dart';
import 'package:flutter_app/tools/request.dart';

class Items with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get getItems {
    return [..._items];
  }

  Item findByName(name) {
    return _items.firstWhere((item) => item.itemName == name);
  }

  Future addItem(userId, name, idealConsumption, systemId, context) async {
    try {
      final response = await sendRequest(
        route: "/control/item",
        method: "POST",
        load: {
          "user_id": userId,
          "system_id": systemId,
          "name": name,
          "ideal_consumption": idealConsumption,
        },
        context: context,
      );

      if (response["message"] != null) {
        throw HttpException(response["message"]);
      }

      Item newItem = Item(
        itemId: response["_id"],
        itemName: name,
        idealConsumption: idealConsumption,
        liveConsumption: 0,
        status: false,
      );

      _items.add(newItem);
      notifyListeners();
    } catch (e) {
      rethrow;
    }

    notifyListeners();
  }

  void emptyItems() {
    _items = [];
  }

  void loadItems(List items) {
    for (var item in items) {
      Item newItem = Item(
        itemId: item["_id"],
        itemName: item["name"],
        idealConsumption: item["ideal_consumption"].toDouble(),
        liveConsumption: item["live_consumption"].toDouble(),
        status: item["status"],
      );

      _items.add(newItem);
    }
    notifyListeners();
  }

  Future toggleStatus(userId, systemId, itemId, context) async {}
}
