import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/System.model.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List systems = [
    System(
        name: "Work",
        connection: "connect 1",
        consumption: 100,
        charging: 80,
        items: [
          "item",
          "hello",
          "itemmm",
          "another",
        ]),
    System(
        name: "Home",
        connection: "connect 2",
        consumption: 120,
        charging: 30,
        items: [
          "item",
          "hello",
          "itemmm",
          "another",
        ]),
    System(
        name: "Office",
        connection: "connect 3",
        consumption: 150,
        charging: 120,
        items: [
          "item",
          "hello",
          "itemmm",
          "another",
        ]),
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
          actions: [
            SizedBox(
              width: 100,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_active_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: systems.map((system) {
              return Container(child: Text(system.name));
            }).toList(),
          ),
        ));
  }
}
