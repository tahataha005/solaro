import 'package:flutter/material.dart';
import 'package:flutter_app/tools/color.constructor.dart';

class BrightTheme {
  ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Color.fromRGBO(0, 114, 187, 1),
      ),
    ),
  );

  ThemeData get themeData => theme;
}
