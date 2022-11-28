import 'package:flutter/material.dart';
import 'package:flutter_app/tools/color.constructor.dart';

class DarkTheme {
  ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );

  ThemeData get themeData => theme;
}
