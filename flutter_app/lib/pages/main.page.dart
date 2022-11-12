import 'package:flutter/material.dart';
import 'package:flutter_app/providers/items.provider.dart';
import 'package:flutter_app/providers/system.provider.dart';
import 'package:flutter_app/widgets/content.card.dart';
import 'package:flutter_app/widgets/costumed.button.dart';
import 'package:flutter_app/widgets/item.card.dart';
import 'package:flutter_app/widgets/labeled.progress.bar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    System system = ModalRoute.of(context)?.settings.arguments as System;
    final List items = system.items;

    double maxConsumption = 7;
    double system_charging = system.charging;
    double system_consumption = system.consumption;
    double currentConsumption = system_consumption / 7;
    double currentCharging = system_charging / 7;

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).accentColor,
            ),
            backgroundColor: Colors.white,
            floating: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(),
          ),
        ],
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
                      Text(
                        "Statistics",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                  content: Column(
                    children: [
                      Text(
                        "History",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Bar Graph"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<Items>(
                  builder: (context, items, child) => ContentCard(
                    content: Column(children: [
                      Text(
                        "Items",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      items.getItems.length > 0
                          ? ItemCard(item_name: items.getItems[0].item_name)
                          : Container(),
                      items.getItems.length > 1
                          ? ItemCard(item_name: items.getItems[1].item_name)
                          : Container(),
                      items.getItems.length > 2
                          ? ItemCard(item_name: items.getItems[2].item_name)
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
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
