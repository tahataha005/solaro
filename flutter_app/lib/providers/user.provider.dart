import 'package:flutter/cupertino.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/tools/request.dart';

class User extends ChangeNotifier {
  String? id;
  String? email;
  String? userType;
  Systems? systems;

  Future setSystems() async {
    try {
      final response =
          await sendRequest(route: "/read/63669e05e464e3fb910146c8");
      id = response["user_id"];
      email = response["email"];
      userType = response["userType"];
      systems = response["system"];
    } catch (e) {}
  }
}
