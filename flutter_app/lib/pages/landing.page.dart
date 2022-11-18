import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth.provider.dart';
import 'package:flutter_app/providers/items.provider.dart';
import 'package:flutter_app/providers/system.provider.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/providers/user.provider.dart';
import 'package:flutter_app/tools/request.dart';
import 'package:flutter_app/widgets/modal.sheet.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List stats = [];

  Future getweekly(id) async {
    final response = await sendRequest(
      route: "/data/system/avg",
      context: context,
      method: "POST",
      load: {
        "system_id": id,
      },
    );

    setState(() {
      stats = response;
    });
  }

  String stringBuilder(List items) {
    if (items.isEmpty) {
      return "No items yet";
    }
    String itemsString = "";
    for (var i = 0; i < items.length; i++) {
      itemsString = itemsString + items[i]["name"] + ", ";
    }
    return itemsString;
  }

  Color randColor(String name) {
    int countName = name.length;
    while (countName >= 3) {
      countName = countName % 3;
    }
    List colors = [
      Theme.of(context).primaryColor,
      Theme.of(context).accentColor,
      Colors.blueGrey,
    ];
    return colors[countName];
  }

  Widget systemsBuilder(System system) {
    return InkWell(
      onTap: () async {
        Provider.of<User>(context, listen: false).setCurrentSystemId(system.id);
        final systemId =
            Provider.of<User>(context, listen: false).getCurrentSystemId;
        Provider.of<Items>(context, listen: false).emptyItems();
        Provider.of<Items>(context, listen: false).loadItems(system.items);
        await getweekly(systemId);
        Navigator.pushNamed(context, "/main",
            arguments: {"system": system, "stats": stats});
      },
      splashColor: Theme.of(context).accentColor,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 223, 223, 223),
            ),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.15,
        child: Row(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: Text(
                system.name[0],
                style: TextStyle(
                  fontFamily: "Kanit",
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
                color: randColor(system.name),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    system.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    stringBuilder(system.items),
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<System> systems = Provider.of<Systems>(context).getSystems;
    Future refresh() async {
      final id = Provider.of<Auth>(context, listen: false).getUserId;
      final response = await sendRequest(route: "/read/$id", context: context);
      print("response");
      print(response["system"]);
      await Provider.of<Systems>(context, listen: false)
          .loadSystems(response["system"]);
      setState(() {
        systems = Provider.of<Systems>(context, listen: false).getSystems;
      });
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(
          width: 180,
          child: Image.asset(
            "assets/images/Header-Logo.png",
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: [
          SizedBox(
            width: 100,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/notifications");
              },
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.all(10),
        child: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => ModalSheet(),
            );
          },
        ),
      ),
      body: RefreshIndicator(
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: systems.map((system) {
            return systemsBuilder(system);
          }).toList(),
        ),
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            setState(() {
              refresh();
            });
          });
        },
      ),
    );
  }
}
