import 'package:flutter/cupertino.dart';

class Item with ChangeNotifier {
  final String itemId;
  final String itemName;
  final String consumptionPin;
  final String controlPin;
  final double idealConsumption;
  double liveConsumption;
  bool status;

  Item({
    required this.itemId,
    required this.itemName,
    required this.consumptionPin,
    required this.controlPin,
    required this.idealConsumption,
    required this.liveConsumption,
    required this.status,
  });
}
