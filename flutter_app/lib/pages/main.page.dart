import 'package:flutter/material.dart';
import 'package:flutter_app/providers/item.provider.dart';
import 'package:flutter_app/widgets/content.card.dart';
import 'package:flutter_app/widgets/costumed.button.dart';
import 'package:flutter_app/widgets/item.card.dart';
import 'package:flutter_app/widgets/labeled.progress.bar.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List items = [
    Item(
      item_name: "Refrigerator",
      ideal_consumption: 3,
      live_consumption: 2.8,
      status: true,
    ),
    Item(
      item_name: "Lights",
      ideal_consumption: 1.5,
      live_consumption: 1.4,
      status: true,
    ),
    Item(
      item_name: "TV",
      ideal_consumption: 100,
      live_consumption: 101,
      status: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double maxConsumption = 7;
    double system_charging = 5;
    double system_consumption = 3;
    double currentConsumption = system_consumption / 7;
    double currentCharging = system_charging / 7;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: Container(
            width: 180,
            child: Image.asset(
              "assets/images/Header-Logo.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).primaryColorLight,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ContentCard(
                content: Column(
                  children: [
                    LabeledProgressBar(
                      label: "Charging",
                      progress: currentCharging,
                      progress_color: Theme.of(context).accentColor,
                    ),
                    LabeledProgressBar(
                      label: "Consumption",
                      progress: currentConsumption,
                      progress_color: currentConsumption > currentCharging
                          ? Colors.red[900]
                          : Theme.of(context).accentColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ContentCard(
                content: Text("Bar Graph"),
              ),
              SizedBox(
                height: 20,
              ),
              ContentCard(
                content: Column(children: [
                  items.length > 0
                      ? ItemCard(item_name: items[0].item_name)
                      : Container(),
                  items.length > 1
                      ? ItemCard(item_name: items[1].item_name)
                      : Container(),
                  items.length > 2
                      ? ItemCard(item_name: items[2].item_name)
                      : Container(),
                  CostumedButton(
                    height: 50,
                    width: double.infinity,
                    raduis: 15,
                    background: Theme.of(context).accentColor,
                    text: "ALL",
                    onPressed: () {
                      Navigator.pushNamed(context, "/items");
                    },
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
