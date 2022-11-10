import 'package:flutter/cupertino.dart';

class System with ChangeNotifier {
  final String? id;
  final String connection;
  String name;
  double charging;
  double consumption;
  List items;

  System({
    this.id,
    required this.name,
    required this.connection,
    required this.consumption,
    required this.charging,
    required this.items,
  });
}
