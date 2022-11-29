import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/socket.config.dart';
import '../notificationservice/notification.dart';
import '../notificationservice/push_notification.dart';
import '../providers/auth.provider.dart';
import '../providers/items.provider.dart';
import '../providers/notifications.provider.dart';
import '../providers/systems.provider.dart';
import '../providers/user.provider.dart';
import '../tools/random.color.dart';
import '../tools/request.dart';
import '../tools/string.builder.dart';
import '../widgets/empty.state.dart';
import '../widgets/main.drawer.dart';
import '../widgets/modal.sheet.dart';
import '../widgets/system.card.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List stats = [];

  @override
  void initState() {
    super.initState();

    //Checking if show notifications is enabled
    final showNotifications =
        Provider.of<Notifications>(context, listen: false).getShowNotifications;

    //If true then enable notifications
    if (showNotifications) {
      PushNotification.pushNotification(context);
    }
  }

  //Getting weekly consumption
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

  @override
  Widget build(BuildContext context) {
    List systems = Provider.of<Systems>(context).getSystems;

    //Refreshing systems
    Future refresh() async {
      final prefs = await SharedPreferences.getInstance();
      final String? userID = prefs.getString("user_id");
      final id = Provider.of<Auth>(context, listen: false).getUserId;

      //Getting systems
      final response = await sendRequest(route: "/read/$id", context: context);

      //Emptying systems
      Provider.of<Systems>(context, listen: false).emptySystems();
      await Provider.of<Systems>(context, listen: false)
          .loadSystems(response["system"]);

      //Display new systems
      setState(() {
        systems = Provider.of<Systems>(context, listen: false).getSystems;
      });
    }

    //Selecting system
    Future selectSystem(system) async {
      //Get weekly consumption
      await getweekly(system.id);

      //Get items
      Provider.of<Items>(context, listen: false).loadItems(system.items);

      //Settin current system
      Provider.of<User>(context, listen: false).setCurrentSystemId(system.id);

      //Navigating to main page
      Navigator.pushNamed(
        context,
        "/main",
        arguments: {"system": system, "stats": stats},
      );
    }

    //Initializing socket
    Socket.connect();

    //Getting device token
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
        margin: const EdgeInsets.all(10),
        child: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
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
        child: systems.isNotEmpty
            ? ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: systems.map((system) {
                  return SystemCard(
                    system: system,
                    items: stringBuilder(system.items),
                    leadingColor: randColor(system.name, context),
                    onTap: () => selectSystem(system),
                  );
                }).toList(),
              )
            : EmptyState(
                text: "No systems added yet",
              ),
        onRefresh: () {
          return Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              refresh();
            });
          });
        },
      ),
    );
  }
}
