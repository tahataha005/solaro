import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth.provider.dart';
import 'package:flutter_app/providers/items.provider.dart';
import 'package:flutter_app/providers/notifications.provider.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/widgets/buttons/drawer.button.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Map selections = {
    "home": false,
    "notifications": false,
    "settings": false,
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.only(top: 50),
                  child: Image.asset("assets/images/Header-Logo.png"),
                ),
                DrawerButton(
                  text: "Home",
                  selected: selections["home"],
                  onPressed: () {},
                ),
                DrawerButton(
                  text: "Notifications",
                  selected: selections["notifications"],
                  onPressed: () {},
                ),
                DrawerButton(
                  text: "Settings",
                  selected: selections["settings"],
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            child: DrawerButton(
              text: "Log Out",
              selected: false,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
