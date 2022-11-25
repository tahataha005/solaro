import 'package:flutter/material.dart';

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
    return Drawer();
  }
}
