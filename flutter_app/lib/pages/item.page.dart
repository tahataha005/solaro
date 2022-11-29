import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/request.config.dart';
import '../providers/auth.provider.dart';
import '../config/socket.config.dart';
import '../providers/user.provider.dart';
import '../widgets/buttons/costumed.button.dart';
import '../providers/items.provider.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    final itemName = ModalRoute.of(context)?.settings.arguments as String;
    final loadedItem = Provider.of<Items>(context).findByName(itemName);
    bool status = loadedItem.status;

    //Toggling item status
    Future toggleItem(String itemId) async {
      final userId = Provider.of<Auth>(context, listen: false).getUserId;
      final systemId =
          Provider.of<User>(context, listen: false).getCurrentSystemId;

      //Toggle in database
      await Provider.of<Items>(context, listen: false)
          .toggleStatus(userId, systemId, itemId, context);

      setState(() {
        status;
      });
    }

    //Initializing socket
    Socket.connect();
    Socket.socket.on("live ${loadedItem.itemId}", (message) {
      setState(() {
        loadedItem.liveConsumption = message["consumption"];
      });
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: const [
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
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          child: Image.network(
                            "http://${RequestConfig.url}/images/${loadedItem.itemId}.png",
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
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  "Consumption:",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Ideal:"),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "${loadedItem.idealConsumption.toString()} A",
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Live:"),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          status
                              ? "${loadedItem.liveConsumption.toString()} A"
                              : "0",
                          style: Theme.of(context).textTheme.labelSmall,
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
