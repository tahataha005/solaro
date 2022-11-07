import 'package:flutter/material.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/providers/user.provider.dart';
import 'package:provider/provider.dart';

import './pages/create.item.page.dart';
import './pages/details.page.dart';
import './pages/item.page.dart';
import './pages/items.page.dart';
import './pages/main.page.dart';
import './providers/items.provider.dart';
import './tools/color.constructor.dart';
import './pages/register/register.page.dart';
import './pages/landing.page.dart';
import './pages/notifications.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Items(),
        ),
        ChangeNotifierProvider.value(
          value: User(token: "", userId: ""),
        ),
        ChangeNotifierProvider.value(
          value: Systems(),
        ),
      ],
      child: MaterialApp(
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
                titleLarge: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
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
                displayMedium: const TextStyle(
                  color: Color.fromARGB(255, 183, 28, 28),
                  fontFamily: "Inter",
                  fontSize: 16,
                ),
                displaySmall: const TextStyle(
                  color: Color.fromRGBO(0, 114, 187, 1),
                  fontFamily: "Inter",
                  fontSize: 20,
                ),
              ),
        ),
        home: RegisterPage(),
        routes: {
          "/first": (context) => RegisterPage(),
          "/landing": (context) => LandingPage(),
          "/notifications": (context) => NotificationsPage(),
          "/main": (context) => MainPage(),
          "/details": (context) => DetailsPage(),
          "/item": (context) => ItemPage(),
          "/items": (context) => ItemsPage(),
          "/create": (context) => CreateItemPage()
        },
      ),
    );
  }
}
