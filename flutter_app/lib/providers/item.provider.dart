import 'package:flutter/cupertino.dart';

class Item with ChangeNotifier {
  final String item_name;
  final double ideal_consumption;
  final double live_consumption;
  bool status;

  Item({
    required this.item_name,
    required this.ideal_consumption,
    required this.live_consumption,
    required this.status,
  });

  void toggleStatus() {
    status = !status;
    notifyListeners();
  }

  Future addItem() async {}
}
