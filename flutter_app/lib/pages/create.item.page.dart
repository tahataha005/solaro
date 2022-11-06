import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/costumed.button.dart';

class CreateItemPage extends StatefulWidget {
  @override
  State<CreateItemPage> createState() => _CreateItemPageState();
}

class _CreateItemPageState extends State<CreateItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: SizedBox(
                    child: Icon(Icons.add, size: 200, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    decoration: InputDecoration(
                  label: Text(
                    "Item Name",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    decoration: InputDecoration(
                  label: Text(
                    "Ideal Consumption",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                TextField(
                    decoration: InputDecoration(
                  label: Text(
                    "Connection",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )),
                SizedBox(
                  height: 40,
                ),
                CostumedButton(
                  height: 50,
                  width: double.infinity,
                  raduis: 15,
                  background: Theme.of(context).primaryColor,
                  text: "ADD",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}