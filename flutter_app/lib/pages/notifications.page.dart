import 'package:flutter/material.dart';
import '../models/notifications.model.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List notifications = [
    Notifications(
        system_name: "Work",
        title: "Warning !!!",
        content: "Concumption too high today",
        time: "12:08")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        children: notifications.map((notification) {
          return Text(notification.system_name);
        }).toList(),
      ),
    );
  }
}
