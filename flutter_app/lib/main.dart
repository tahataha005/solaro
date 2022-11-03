import 'package:flutter/material.dart';
import 'package:flutter_app/pages/details.page.dart';
import 'package:flutter_app/pages/main.page.dart';

import './tools/color.constructor.dart';
import './pages/register/register.page.dart';
import './pages/landing.page.dart';
import './pages/notifications.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color.fromRGBO(0, 114, 187, 1)),
        accentColor: Color.fromRGBO(255, 186, 73, 1),
        primaryColorLight: Color.fromRGBO(233, 235, 248, 1),
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
                color: Colors.white,
              ),
              titleMedium: const TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
      home: DetailsPage(),
      routes: {
        "/first": (context) => RegisterPage(),
        "/landing": (context) => LandingPage(),
        "/notifications": (context) => NotificationsPage(),
        "/main": (context) => MainPage(),
      },
    );
  }
}
