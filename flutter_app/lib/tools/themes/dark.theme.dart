import 'package:flutter/material.dart';
import 'package:flutter_app/tools/color.constructor.dart';

class DarkTheme {
  ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    primarySwatch: createMaterialColor(Color.fromARGB(255, 56, 129, 197)),
    accentColor: const Color.fromARGB(255, 255, 165, 20),
    primaryColorLight: const Color.fromARGB(255, 58, 58, 58),
    scaffoldBackgroundColor: const Color.fromARGB(255, 47, 47, 47),
    backgroundColor: const Color.fromARGB(255, 90, 90, 90),
    cardColor: const Color.fromARGB(255, 58, 58, 58),
    dividerColor: const Color.fromARGB(255, 76, 76, 76),
    hintColor: Colors.black.withOpacity(0.4),
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
            //cards
            fontFamily: "Inter",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleLarge: const TextStyle(
            //pages title
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(255, 186, 73, 1),
          ),
          labelSmall: const TextStyle(
            // /cards sections
            fontSize: 20,
            color: Colors.white,
          ),
          labelMedium: const TextStyle(
            // /cards sections
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          labelLarge: const TextStyle(
            //buttons
            fontFamily: "Inter",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodySmall: const TextStyle(
            //cards and account log/sign
            fontFamily: "Inter",
            fontSize: 16,
            color: Colors.white,
          ),
          bodyMedium: const TextStyle(
            //labels
            fontFamily: "Inter",
            fontSize: 20,
            color: Colors.white,
          ),
          bodyLarge: const TextStyle(
            // item page title small
            fontFamily: "Inter",
            fontSize: 24,
            color: Colors.white,
          ),
          displaySmall: const TextStyle(
            // modal sheet add
            fontFamily: "Inter",
            fontSize: 20,
            color: Color.fromRGBO(0, 114, 187, 1),
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
