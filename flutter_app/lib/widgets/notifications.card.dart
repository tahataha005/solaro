import 'package:flutter/material.dart';
import 'package:flutter_app/tools/random.color.dart';

class NotificationCard extends StatelessWidget {
  final notification;

  NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              color: randColor(notification.system_name, context),
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
}
