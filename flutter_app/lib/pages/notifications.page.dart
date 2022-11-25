import 'package:flutter/material.dart';
import 'package:flutter_app/providers/notifications.provider.dart';
import 'package:flutter_app/widgets/main.drawer.dart';
import 'package:flutter_app/widgets/notifications.card.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  Color randColor(String name) {
    int countName = name.length;
    while (countName >= 3) {
      countName = countName % 3;
    }
    List colors = [
      Theme.of(context).primaryColor,
      Theme.of(context).accentColor,
      Colors.blueGrey,
    ];
    return colors[countName];
  }

  @override
  Widget build(BuildContext context) {
    final List notifications =
        Provider.of<Notifications>(context).getNotifications;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
        toolbarHeight: 100,
        title: Container(
          width: 180,
          child: Image.asset(
            "assets/images/Header-Logo.png",
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      drawer: MainDrawer(title: "notifications"),
      body: Column(
        children: notifications.reversed.map((notification) {
          return NotificationCard(notification: notification);
        }).toList(),
      ),
    );
  }
}
