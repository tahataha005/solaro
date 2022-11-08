import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../tools/request.dart';
import '../models/exception.model.dart';

class Auth with ChangeNotifier {
  String? userId;
  String? token;

  String? get getUserId {
    if (userId != null) {
      return userId;
    }

    return null;
  }

  String? get getToken {
    if (token != null) {
      return token;
    }

    return null;
  }

  Future login(email, password) async {
    final url = Uri.http("192.168.1.12:8000", "/auth/login");
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      final data = json.decode(response.body);

      if (data["message"] != null) {
        throw HttpException(data["message"]);
      }

      userId = data["user_id"];
      token = data["token"];
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future signUp(email, password, userType) async {
    try {
      final response = await sendRequest(
        method: "POST",
        route: "/auth/signup",
        load: {
          "email": email,
          "password": password,
          "user_type": userType,
        },
      );

      if (response["message"] != null) {
        throw HttpException(response["message"]);
      }

      userId = response["user_id"];
      token = response["token"];
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
