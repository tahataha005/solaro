import 'package:flutter/material.dart';
import 'package:flutter_app/models/item.model.dart';
import 'package:flutter_app/providers/items.provider.dart';
import 'package:flutter_app/widgets/costumed.button.dart';
import 'package:flutter_app/widgets/item.card.dart';
import 'package:provider/provider.dart';

class ItemsPage extends StatefulWidget {
  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    final loaded_items = Provider.of<Items>(context);
    final items = loaded_items.items;
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
                    onPressed: () {
                      Navigator.pushNamed(context, "/create");
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<Items>(
                builder: (context, items, child) => Column(
                  children: items.items
                      .map((item) => ItemCard(item_name: item.item_name))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
