import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themes with ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  void setDarkMode(bool value) async {
    _darkMode = value;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
    notifyListeners();
  }
}
