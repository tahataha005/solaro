import 'package:flutter/cupertino.dart';
import 'package:flutter_app/providers/items.provider.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/tools/request.dart';

class User extends ChangeNotifier {
  String? id;
  String? email;
  String? userType;
  Systems? systems;
  Items? items;

  Future setSystems() async {
    final response = await sendRequest(route: "/read/63669e05e464e3fb910146c8");
  }
}
