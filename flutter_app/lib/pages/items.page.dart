import 'package:flutter/material.dart';
import 'package:flutter_app/models/item.model.dart';
import 'package:flutter_app/widgets/costumed.button.dart';
import 'package:flutter_app/widgets/item.card.dart';

class ItemsPage extends StatefulWidget {
  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
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
    Item(
      item_name: "TV",
      ideal_consumption: 4.5,
      live_consumption: 0,
      status: false,
    ),
    Item(
      item_name: "Heater",
      ideal_consumption: 2,
      live_consumption: 0,
      status: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                  ),
                  CostumedButton(
                    height: 50,
                    width: 150,
                    raduis: 15,
                    background: Theme.of(context).accentColor,
                    text: "ADD",
                    onPressed: () {},
                  )
                ],
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
