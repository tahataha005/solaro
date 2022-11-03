import 'package:flutter/material.dart';
import 'package:flutter_app/models/item.model.dart';
import 'package:flutter_app/widgets/item.card.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double maxConsumption = 7;
  double system_charging = 5;
  double system_consumption = 3.5;

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
      item_name: "Mokhe",
      ideal_consumption: 100,
      live_consumption: 101,
      status: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Charging:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: currentCharging,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            height: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Consumption:",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: currentConsumption,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            height: 40,
                            decoration: BoxDecoration(
                                color: currentConsumption >= currentCharging
                                    ? Colors.red
                                    : Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Text("Bar Graph"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Column(children: [
                  items.length > 0
                      ? ItemCard(item_name: items[0].item_name)
                      : Container(),
                  items.length > 1
                      ? ItemCard(item_name: items[1].item_name)
                      : Container(),
                  items.length > 2
                      ? ItemCard(item_name: items[2].item_name)
                      : Container(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).accentColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("ADD"),
                    ),
                  )
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
