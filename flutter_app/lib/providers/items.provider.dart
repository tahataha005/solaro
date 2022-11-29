import 'package:flutter/cupertino.dart';
import '../models/exception.model.dart';
import '../providers/item.provider.dart';
import '../tools/request.dart';

class Items with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get getItems {
    return [..._items];
  }

  Item findByName(name) {
    return _items.firstWhere((item) => item.itemName == name);
  }

  //Creating new item
  Future addItem(
    userId,
    name,
    idealConsumption,
    systemId,
    consumptionPin,
    controlPin,
    encoded,
    context,
  ) async {
    try {
      final response = await sendRequest(
        route: "/control/item",
        method: "POST",
        load: {
          "user_id": userId,
          "system_id": systemId,
          "name": name,
          "consumptionPin": consumptionPin,
          "controlPin": controlPin,
          "ideal_consumption": idealConsumption,
          "picture": encoded,
        },
        context: context,
      );

      if (response["message"] != null) {
        throw HttpException(response["message"]);
      }

      Item newItem = Item(
        itemId: response["_id"],
        itemName: name,
        consumptionPin: consumptionPin,
        controlPin: controlPin,
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

  //Get all items
  void loadItems(List items) {
    for (var item in items) {
      Item newItem = Item(
        itemId: item["_id"],
        itemName: item["name"],
        consumptionPin: item["consumptionPin"],
        controlPin: item["controlPin"],
        idealConsumption: item["ideal_consumption"].toDouble(),
        liveConsumption: 0,
        status: item["status"],
      );

      _items.add(newItem);
    }
    notifyListeners();
  }

  //Update item's status
  Future toggleStatus(userId, systemId, itemId, context) async {
    final item = _items.firstWhere((item) => item.itemId == itemId);

    final response = await sendRequest(
      route: "/control",
      method: "PUT",
      load: {
        "user_id": userId,
        "system_id": systemId,
        "item_id": itemId,
      },
      context: context,
    );
    item.status = !item.status;
    notifyListeners();
  }

  //Emptying items list
  void emptyItems() {
    _items = [];
    notifyListeners();
  }
}
