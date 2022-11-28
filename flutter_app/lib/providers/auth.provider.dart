import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/config/request.config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
    final baseUrl = RequestConfig.url;
    final url = Uri.http(baseUrl, "/auth/login");

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

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString("user_id", data["user_id"]);
      await prefs.setString("token", data["token"]);

      userId = data["user_id"];
      token = data["token"];
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future signUp(email, password, userType, context) async {
    final baseUrl = RequestConfig.url;
    final url = Uri.http(baseUrl, "/auth/login");

    try {
      final response = await sendRequest(
        method: "POST",
        route: "/auth/signup",
        load: {
          "email": email,
          "password": password,
          "user_type": userType,
        },
        context: context,
      );

      if (response["message"] != null) {
        throw HttpException(response["message"]);
      }

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString("user_id", response["user_id"]);
      await prefs.setString("token", response["token"]);

      userId = response["user_id"];
      token = response["token"];
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    userId = null;
    token = null;
    notifyListeners();
  }
}
