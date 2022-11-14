import 'package:flutter/cupertino.dart';

class Item with ChangeNotifier {
  final String itemName;
  final double idealConsumption;
  double liveConsumption;
  bool status;

  Item({
    required this.itemName,
    required this.idealConsumption,
    required this.liveConsumption,
    required this.status,
  });

  void toggleStatus() {
    status = !status;
    notifyListeners();
  }
}
