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
    primarySwatch: createMaterialColor(Color.fromARGB(255, 56, 129, 197)),
    accentColor: Color.fromARGB(255, 255, 165, 20),
    primaryColorLight: Color.fromARGB(255, 58, 58, 58),
    scaffoldBackgroundColor: Color.fromARGB(255, 47, 47, 47),
    backgroundColor: Color.fromARGB(255, 90, 90, 90),
    cardColor: Color.fromARGB(255, 58, 58, 58),
    dividerColor: Color.fromARGB(255, 76, 76, 76),
    hintColor: Colors.black.withOpacity(0.4),
    fontFamily: "Inter",
    textTheme: ThemeData.light().textTheme.copyWith(),
  );

  ThemeData get themeData => theme;
}
