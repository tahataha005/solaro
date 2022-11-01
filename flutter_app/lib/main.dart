import 'tools/color.constructor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/register/register.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color.fromRGBO(0, 114, 187, 1)),
        accentColor: Color.fromRGBO(255, 186, 73, 1),
        fontFamily: "Inter",
        textTheme: ThemeData.light().textTheme.copyWith(
              labelMedium: const TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                color: Colors.white,
              ),
              labelLarge: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              titleMedium: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              bodySmall: const TextStyle(
                fontFamily: "Inter",
                fontSize: 16,
              ),
              bodyMedium: const TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
              ),
              bodyLarge: const TextStyle(
                fontFamily: "Inter",
                fontSize: 24,
              ),
            ),
      ),
      home: RegisterPage(),
    );
  }
}
