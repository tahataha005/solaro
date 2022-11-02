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

  Widget systemsBuilder(system) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).accentColor,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 223, 223, 223),
            ),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.15,
        child: Row(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: Text(
                system.name[0],
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
                color: randColor(system.name),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  system.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  stringBuilder(system.items),
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

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
              return systemsBuilder(system);
            }).toList(),
          ),
        ));
  }
}
