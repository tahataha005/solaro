import 'package:flutter/cupertino.dart';
import 'package:flutter_app/providers/items.provider.dart';
import 'package:flutter_app/providers/systems.provider.dart';

class User extends ChangeNotifier {
  String? id;
  String? email;
  String? userType;
  Systems? systems;
  Items? items;
}
