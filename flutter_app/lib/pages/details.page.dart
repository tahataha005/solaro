import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/content.card.dart';
import 'package:flutter_app/widgets/buttons/costumed.button.dart';

//This page is still under development//

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(20),
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
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
            const SizedBox(
              height: 50,
            ),
            ContentCard(
              content: Text("Graph"),
            ),
            const SizedBox(
              height: 20,
            ),
            CostumedButton(
                height: 50,
                width: double.infinity,
                raduis: 15,
                background: Theme.of(context).primaryColor,
                text: "Graph"),
            const SizedBox(
              height: 50,
            ),
            Column(
                // children: items
                //     .map((item) => ItemCard(item_name: item.item_name))
                //     .toList(),
                )
          ],
        ),
      ),
    );
  }
}
