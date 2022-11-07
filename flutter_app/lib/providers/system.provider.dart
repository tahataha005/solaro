import 'package:flutter/cupertino.dart';
import 'package:flutter_app/providers/item.provider.dart';

class System extends ChangeNotifier {
  final String name;
  final String connection;
  double charging;
  double consumption;
  List<Item> items;

  System({
    required this.name,
    required this.connection,
    required this.consumption,
    required this.charging,
    required this.items,
  });
}
