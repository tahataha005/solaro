import 'package:flutter/material.dart';
import 'package:flutter_app/notificationservice/notification.dart';
import 'package:flutter_app/notificationservice/push_notification.dart';
import 'package:flutter_app/providers/auth.provider.dart';
import 'package:flutter_app/providers/items.provider.dart';
import 'package:flutter_app/providers/system.provider.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/providers/user.provider.dart';
import 'package:flutter_app/tools/random.color.dart';
import 'package:flutter_app/tools/request.dart';
import 'package:flutter_app/tools/string.builder.dart';
import 'package:flutter_app/widgets/buttons/costumed.button.dart';
import 'package:flutter_app/widgets/buttons/drawer.button.dart';
import 'package:flutter_app/widgets/main.drawer.dart';
import 'package:flutter_app/widgets/modal.sheet.dart';
import 'package:flutter_app/widgets/system.card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/socket.config.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List systems = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      systems = Provider.of<Systems>(context, listen: false).systems;
    });

    PushNotification.pushNotification(context);
  }

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

  List stats = [];

  @override
  Widget build(BuildContext context) {
    Future refresh() async {
      final prefs = await SharedPreferences.getInstance();

      final String? userID = prefs.getString("user_id");
      print("here is prefs: $userID");

      final id = Provider.of<Auth>(context, listen: false).getUserId;
      final response = await sendRequest(route: "/read/$id", context: context);
      Provider.of<Systems>(context).emptySystems();
      await Provider.of<Systems>(context, listen: false)
          .loadSystems(response["system"]);
      setState(() {
        systems = Provider.of<Systems>(context, listen: false).getSystems;
      });
    }

    Socket.connect();
    MyNotification.getToken();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        toolbarHeight: 100,
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: [
          SizedBox(
            width: 100,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/settings");
              },
              icon: Icon(
                Icons.settings,
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
      drawer: MainDrawer(title: "home"),
      body: RefreshIndicator(
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: systems.map((system) {
            return SystemCard(
              system: system,
              items: stringBuilder(system.items),
              leadingColor: randColor(system.name, context),
              onTap: () async {
                await getweekly(system.id);
                Provider.of<Items>(context, listen: false)
                    .loadItems(system.items);
                Provider.of<User>(context, listen: false)
                    .setCurrentSystemId(system.id);
                Navigator.pushNamed(context, "/main",
                    arguments: {"system": system, "stats": stats});
              },
            );
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
