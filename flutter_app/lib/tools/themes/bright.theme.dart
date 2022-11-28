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
    primarySwatch: createMaterialColor(Color.fromRGBO(0, 114, 187, 1)),
    accentColor: Color.fromRGBO(255, 186, 73, 1),
    primaryColorLight: Color.fromRGBO(233, 235, 248, 1),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    cardColor: Color.fromRGBO(233, 235, 248, 1),
    dividerColor: Color.fromARGB(255, 223, 223, 223),
    hintColor: Colors.white.withOpacity(0.6),
    fontFamily: "Inter",
    textTheme: ThemeData.light().textTheme.copyWith(
          titleSmall: const TextStyle(
            // drawer log in as
            color: Color.fromRGBO(0, 114, 187, 1),
            fontFamily: "kanit",
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            //card titles
            fontFamily: "Inter",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: const TextStyle(
            //pages title
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(255, 186, 73, 1),
          ),
        ),
  );

  ThemeData get themeData => theme;
}
