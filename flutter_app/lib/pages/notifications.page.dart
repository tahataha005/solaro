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
          return InkWell(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 223, 223, 223)),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Center(
                    child: Text(
                      notification.system_name[0],
                      style: TextStyle(
                        fontFamily: "Kanit",
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ]),
            ),
          );
        }).toList(),
      ),
    );
  }
}
