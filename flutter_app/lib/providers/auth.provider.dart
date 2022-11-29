import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../config/request.config.dart';
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

  //Login
  Future login(email, password, context) async {
    try {
      final response = await sendRequest(
          route: "/auth/login",
          context: context,
          method: "POST",
          load: {
            "email": email,
            "password": password,
          });

      if (response["message"] != null) {
        throw HttpException(response["message"]);
      }

      //Save user id and token
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

  //Sign up
  Future signUp(email, password, userType, context) async {
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

      //Save user id and token
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

  //Log out
  Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    userId = null;
    token = null;
    notifyListeners();
  }
}
