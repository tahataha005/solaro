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
          labelMedium: const TextStyle(
            //Inputs
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(56, 56, 56, 1),
          ),
          labelSmall: const TextStyle(
            //Inputs
            fontSize: 20,
            color: Color.fromRGBO(56, 56, 56, 1),
          ),
          labelLarge: const TextStyle(
            //buttons
            fontFamily: "Inter",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: const TextStyle(
            // item page title small
            fontFamily: "Inter",
            fontSize: 24,
          ),
          bodyMedium: const TextStyle(
            //labels
            fontFamily: "Inter",
            fontSize: 20,
          ),
          bodySmall: const TextStyle(
            //cards and account log/sign
            fontFamily: "Inter",
            fontSize: 16,
          ),
          displaySmall: const TextStyle(
            // modal sheet add
            color: Color.fromRGBO(0, 114, 187, 1),
            fontFamily: "Inter",
            fontSize: 20,
          ),
          displayMedium: const TextStyle(
            // errors
            color: Color.fromARGB(255, 183, 28, 28),
            fontFamily: "Inter",
            fontSize: 16,
          ),
          displayLarge: const TextStyle(
            // drawer log in as
            color: Colors.grey,
            fontFamily: "Inter",
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
  );

  ThemeData get themeData => theme;
}
