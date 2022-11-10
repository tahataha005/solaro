import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/exception.model.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/tools/request.dart';
import 'package:provider/provider.dart';

class User with ChangeNotifier {
  String? email;
  String? userType;
  String? currentSystemId;

  void setCurrentSystemId(String systemId) {
    currentSystemId = systemId;
    notifyListeners();
  }

  Future getUser(String id, context) async {
    try {
      final response = await sendRequest(route: "/read/$id", context: context);

      if (response["message"] != null) {
        throw HttpException(response["message"]);
      }

      email = response["email"];
      userType = response["user_type"];
      List systems = response["system"];

      Provider.of<Systems>(context, listen: false).loadSystems(systems);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
