import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/costumed.button.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 3), //(x,y)
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        child: Image.asset(
                          "assets/images/Item 1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 320,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).primaryColorLight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Refrigerator",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Consumption:",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    Text("Ideal:"),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text("5"),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Ideal:"),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text("4.8"),
                      ),
                    )
                  ],
                ),
                CostumedButton(
                  height: 50,
                  width: double.infinity,
                  raduis: 15,
                  background: status
                      ? Theme.of(context).accentColor
                      : Theme.of(context).primaryColor,
                  text: status ? "ON" : "OFF",
                  onPressed: () {
                    setState(() {
                      status = !status;
                      print(status);
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
