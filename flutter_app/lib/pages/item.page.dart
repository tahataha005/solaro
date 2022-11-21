import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth.provider.dart';
import '../config/socket.config.dart';
import 'package:flutter_app/providers/user.provider.dart';
import 'package:flutter_app/widgets/costumed.button.dart';
import 'package:provider/provider.dart';
import '../providers/items.provider.dart';

class ItemPage extends StatefulWidget {
  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    final itemName = ModalRoute.of(context)?.settings.arguments as String;
    final loadedItem = Provider.of<Items>(context).findByName(itemName);
    bool status = loadedItem.status;
    Future toggleItem(String itemId) async {
      final userId = Provider.of<Auth>(context, listen: false).getUserId;
      final systemId =
          Provider.of<User>(context, listen: false).getCurrentSystemId;

      final response = await Provider.of<Items>(context, listen: false)
          .toggleStatus(userId, systemId, itemId, context);

      setState(() {
        status;
      });
    }

    Socket.connect();
    Socket.socket.on("live ${loadedItem.itemId}", (message) {
      print(message);
      setState(() {
        loadedItem.liveConsumption = message["consumption"];
      });
    });
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                    fit: StackFit.loose,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          child: Image.asset(
                            "assets/images/Item 2.png",
                            fit: BoxFit.cover,
                          ),
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
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).primaryColorLight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  loadedItem.itemName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Consumption:",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        child: Text(
                          // loaded_item.ideal_consumption.toString(),
                          loadedItem.idealConsumption.toString(),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Live:"),
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
                        child: Text(
                          status ? loadedItem.liveConsumption.toString() : "0",
                        ),
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
                    toggleItem(loadedItem.itemId);
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
