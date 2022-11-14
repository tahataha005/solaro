import 'package:flutter/cupertino.dart';
import 'package:flutter_app/tools/request.dart';

class Item with ChangeNotifier {
  final String itemId;
  final String itemName;
  final double idealConsumption;
  double liveConsumption;
  bool status;

  Item({
    required this.itemId,
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
