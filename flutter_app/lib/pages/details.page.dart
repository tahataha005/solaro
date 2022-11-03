import 'package:flutter/material.dart';
import 'package:flutter_app/models/item.model.dart';
import 'package:flutter_app/widgets/content.card.dart';
import 'package:flutter_app/widgets/costumed.button.dart';
import 'package:flutter_app/widgets/item.card.dart';

class DetailsPage extends StatefulWidget {
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
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
    String dropdownvalue = 'Monday';

    final drops = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                    style: Theme.of(context).textTheme.bodyMedium,
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: drops.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ContentCard(
              content: Text("Graph"),
              color: Theme.of(context).primaryColorLight,
            ),
            SizedBox(
              height: 20,
            ),
            CostumedButton(
                height: 50,
                width: double.infinity,
                raduis: 15,
                background: Theme.of(context).primaryColor,
                text: "Graph"),
            SizedBox(
              height: 20,
            ),
            Column(
                children: items
                    .map((item) => ItemCard(item_name: item.item_name))
                    .toList())
          ],
        ),
      ),
    );
  }
}
