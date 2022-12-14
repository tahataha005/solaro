import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../tools/random.color.dart';
import '../widgets/empty.state.dart';
import '../config/socket.config.dart';
import '../providers/items.provider.dart';
import '../providers/system.provider.dart';
import '../widgets/column.chart.dart';
import '../widgets/content.card.dart';
import '../widgets/buttons/costumed.button.dart';
import '../widgets/item.card.dart';
import '../widgets/labeled.progress.bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;
  List stats = [];

  //Default constructor
  System system = System(
    id: "1",
    name: "not found",
    chargingPin: "not found",
    consumptionPin: "not found",
    capacitance: 1,
    consumption: 0,
    charging: 0,
    items: [],
  );

  //Listening to scroll
  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  //Checking if scroll is shrinked
  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    Socket.socket.off("live ${system.id}");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    double currentConsumption = system.consumption / system.capacitance;
    double currentCharging = system.charging / system.capacitance;

    //Getting system and stats from arguments
    setState(() {
      system = arguments["system"] as System;
      stats = arguments["stats"];
    });

    //Listening to live data
    Socket.socket.on("live ${system.id}", (reading) {
      setState(() {
        system.setConsumption(reading["consumption"]);
        system.charging = reading["charging"];
      });
    });

    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            leading: Container(
              margin: const EdgeInsets.only(left: 10, top: 15),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            iconTheme:
                IconThemeData(color: Theme.of(context).primaryColor, size: 30),
            pinned: true,
            expandedHeight: 270,
            collapsedHeight: 70,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: _isShrink
                  ? Text(
                      "Main",
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  : null,
              background: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            color: randColor(system.name, context),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              system.name[0],
                              style: const TextStyle(
                                fontFamily: "Kanit",
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      system.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Currently tracking: ${system.items.length} items",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Capacitance: ${system.capacitance}A",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Charging Pin: ${system.chargingPin}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Consumption Pin: ${system.consumptionPin}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            actions: _isShrink
                ? [
                    Container(
                      margin: EdgeInsets.only(right: 30, top: 15),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: randColor(system.name, context),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  system.name[0],
                                  style: const TextStyle(
                                    fontFamily: "Kanit",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  system.name,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  "${system.items.length} items",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                : null,
          ),
        ],
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).primaryColorLight,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ContentCard(
                  content: Column(
                    children: [
                      Text(
                        "Statistics",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LabeledProgressBar(
                        label: "Charging",
                        progress: currentCharging,
                        progress_color: Theme.of(context).accentColor,
                      ),
                      LabeledProgressBar(
                        label: "Consumption",
                        progress: currentConsumption,
                        progress_color: currentConsumption > currentCharging
                            ? Colors.red[900]
                            : Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ContentCard(
                  content: Column(
                    children: [
                      Text(
                        "History",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: ColumnChart(data: []),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CostumedButton(
                        height: 50,
                        width: double.infinity,
                        raduis: 15,
                        background: Theme.of(context).accentColor,
                        text: "Details",
                        onPressed: () {
                          Navigator.of(context).pushNamed("/details");
                          dispose();
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<Items>(
                  builder: (context, items, child) => ContentCard(
                    content: Column(children: [
                      Text(
                        "Items",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 580,
                        child: items.getItems.isNotEmpty
                            ? SizedBox(
                                width: double.infinity,
                                height: 580,
                                child: ListView.builder(
                                  itemCount: items.getItems.length < 3
                                      ? items.getItems.length
                                      : items.getItems.length > 3
                                          ? 3
                                          : items.getItems.length,
                                  itemBuilder: (context, index) {
                                    return ItemCard(
                                      item_id: items.getItems[index].itemId,
                                      item_name: items.getItems[index].itemName,
                                    );
                                  },
                                ),
                              )
                            : EmptyState(
                                text: "No items found",
                              ),
                      ),
                      CostumedButton(
                        height: 50,
                        width: double.infinity,
                        raduis: 15,
                        background: Theme.of(context).accentColor,
                        text: "ALL",
                        onPressed: () {
                          Navigator.pushNamed(context, "/items");
                        },
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
