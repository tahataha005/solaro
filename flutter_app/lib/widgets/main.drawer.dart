import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth.provider.dart';
import 'package:flutter_app/providers/items.provider.dart';
import 'package:flutter_app/providers/notifications.provider.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/widgets/buttons/drawer.button.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  String title;

  MainDrawer({required this.title});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.only(top: 50),
                  child: Image.asset("assets/images/Header-Logo.png"),
                ),
                DrawerButton(
                  text: "Home",
                  selected: selections["home"],
                  onPressed: () {
                    setState(() {
                      selections["home"] = true;
                      selections["notifications"] = false;
                      selections["settings"] = false;
                    });
                    Navigator.of(context).pushNamed("/landing");
                  },
                ),
                DrawerButton(
                  text: "Notifications",
                  selected: selections["notifications"],
                  onPressed: () {
                    setState(() {
                      selections["home"] = false;
                      selections["notifications"] = true;
                      selections["settings"] = false;
                    });
                    Navigator.of(context).pushNamed("/notifications");
                  },
                ),
                DrawerButton(
                  text: "Settings",
                  selected: selections["settings"],
                  onPressed: () {
                    setState(() {
                      selections["home"] = false;
                      selections["notifications"] = false;
                      selections["settings"] = true;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 50, left: 20, right: 20),
            child: DrawerButton(
              text: "Log Out",
              selected: false,
              onPressed: () {
                Provider.of<Auth>(context, listen: false).logout();
                Provider.of<Systems>(context, listen: false).emptySystems();
                Provider.of<Items>(context, listen: false).emptyItems();
                Provider.of<Notifications>(context, listen: false)
                    .emptyNotifications();

                Navigator.of(context).pushNamed("/first");
              },
            ),
          ),
        ],
      ),
    );
  }
}
