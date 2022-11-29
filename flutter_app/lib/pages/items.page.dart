import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/empty.state.dart';
import 'package:provider/provider.dart';

import '../providers/item.provider.dart';
import '../providers/items.provider.dart';
import '../widgets/buttons/costumed.button.dart';
import '../widgets/item.card.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    final List<Item> items = Provider.of<Items>(context).getItems;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).accentColor,
                    ),
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
              const SizedBox(
                height: 20,
              ),
              items.isNotEmpty
                  ? Column(
                      children: items
                          .map((item) => ItemCard(
                                item_name: item.itemName,
                                item_id: item.itemId,
                              ))
                          .toList(),
                    )
                  : EmptyState(text: "No Items"),
            ],
          ),
        ),
      ),
    );
  }
}
