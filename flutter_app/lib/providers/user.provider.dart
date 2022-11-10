import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/exception.model.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/tools/request.dart';
import 'package:provider/provider.dart';

class User with ChangeNotifier {
  String? email;
  String? userType;

  Future setSystems() async {
    try {
      final response =
          await sendRequest(route: "/read/63669e05e464e3fb910146c8");

      if (response["message"] != null) {
        throw HttpException(response["message"]);
      }

      email = response["email"];
      userType = response["userType"];
    } catch (e) {
      rethrow;
    }
  }
}
