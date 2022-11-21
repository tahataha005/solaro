import 'package:flutter/material.dart';
import 'package:flutter_app/providers/notifications.provider.dart';
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

  Widget notificationBuilder(notification) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).accentColor,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color.fromARGB(255, 223, 223, 223)),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.15,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: MediaQuery.of(context).size.height * 0.035),
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
              color: randColor(notification.system_name),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.system_name + ": " + notification.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    notification.content,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 40),
            child: Text(
              notification.time,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ]),
      ),
    );
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
      body: Column(
        children: notifications.reversed.map((notification) {
          return notificationBuilder(notification);
        }).toList(),
      ),
    );
  }
}
