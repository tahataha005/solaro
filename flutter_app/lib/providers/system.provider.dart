import 'package:flutter/cupertino.dart';

class System with ChangeNotifier {
  final String id;
  final String chargingPin;
  final String consumptionPin;
  final double capacitance;
  String name;
  double charging;
  double consumption;
  List items;

  System({
    required this.id,
    required this.name,
    required this.chargingPin,
    required this.consumptionPin,
    required this.capacitance,
    required this.consumption,
    required this.charging,
    required this.items,
  });

  void setConsumption(double value) {
    consumption = value;
    notifyListeners();
  }
}
