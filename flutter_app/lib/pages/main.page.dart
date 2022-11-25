import 'package:flutter/material.dart';
import 'package:flutter_app/tools/random.color.dart';
import '../config/socket.config.dart';
import 'package:flutter_app/providers/items.provider.dart';
import 'package:flutter_app/providers/system.provider.dart';
import 'package:flutter_app/widgets/column.chart.dart';
import 'package:flutter_app/widgets/content.card.dart';
import 'package:flutter_app/widgets/buttons/costumed.button.dart';
import 'package:flutter_app/widgets/item.card.dart';
import 'package:flutter_app/widgets/labeled.progress.bar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    System system = arguments["system"] as System;
    List stats = arguments["stats"];

    double maxConsumption = 7;
    final List items = system.items;

    Socket.socket.on("live ${system.id}", (reading) {
      print(reading);
      setState(() {
        system.consumption = reading["consumption"];
        system.charging = reading["charging"];
      });
    });

    double currentConsumption = system.consumption / 10;
    double currentCharging = system.charging / 10;

    @override
    void dispose() {
      print("object111");
      Socket.socket.off("live ${system.id}");
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).accentColor,
            ),
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: _isShrink
                  ? Text(
                      "Main",
                    )
                  : null,
              background: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          child: Center(
                            child: Text(
                              system.name[0],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      system.name,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Currently tracking: ${system.items.length} items",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            actions: _isShrink
                ? [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              child: Center(
                                child: Text(
                                  system.name[0],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              children: [
                                Text(
                                  system.name,
                                ),
                                Text(
                                  "${system.items.length} items",
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).primaryColorLight,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ContentCard(
                  content: Column(
                    children: [
                      Text(
                        "Statistics",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
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
                SizedBox(
                  height: 20,
                ),
                ContentCard(
                  content: Column(
                    children: [
                      Text(
                        "History",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: ColumnChart(data: stats),
                      ),
                      SizedBox(
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
                          Socket.socket.off("live ${system.id}");
                          dispose();
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
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
                        height: 20,
                      ),
                      items.getItems.length > 0
                          ? ItemCard(
                              item_name: items.getItems[0].itemName,
                              item_id: items.getItems[0].itemId,
                            )
                          : Container(),
                      items.getItems.length > 1
                          ? ItemCard(
                              item_name: items.getItems[1].itemName,
                              item_id: items.getItems[1].itemId,
                            )
                          : Container(),
                      items.getItems.length > 2
                          ? ItemCard(
                              item_name: items.getItems[2].itemName,
                              item_id: items.getItems[2].itemId,
                            )
                          : Container(),
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
                SizedBox(
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
