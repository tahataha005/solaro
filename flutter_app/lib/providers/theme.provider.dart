import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themes with ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode => _darkMode;
}
