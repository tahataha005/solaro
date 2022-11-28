import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/notificationservice/local_notification_service.dart';
import 'package:flutter_app/pages/settings.page.dart';
import 'package:flutter_app/providers/notifications.provider.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/providers/auth.provider.dart';
import 'package:flutter_app/providers/theme.provider.dart';
import 'package:flutter_app/providers/user.provider.dart';
import 'package:flutter_app/tools/themes/bright.theme.dart';
import 'package:flutter_app/tools/themes/dark.theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
  LocalNotificationService.createanddisplaynotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Items(),
        ),
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Systems(),
        ),
        ChangeNotifierProvider.value(
          value: User(),
        ),
        ChangeNotifierProvider.value(
          value: Notifications(),
        ),
        ChangeNotifierProvider.value(
          value: Themes(),
        )
      ],
      child: Consumer<Themes>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Provider.of<Themes>(context).darkMode
              ? DarkTheme().theme
              : BrightTheme().themeData,
          home: RegisterPage(),
          routes: {
            "/first": (context) => RegisterPage(),
            "/landing": (context) => LandingPage(),
            "/notifications": (context) => NotificationsPage(),
            "/main": (context) => MainPage(),
            "/details": (context) => DetailsPage(),
            "/item": (context) => ItemPage(),
            "/items": (context) => ItemsPage(),
            "/create": (context) => CreateItemPage(),
            "/settings": (context) => SettingsPage(),
          },
        ),
      ),
    );
  }
}
