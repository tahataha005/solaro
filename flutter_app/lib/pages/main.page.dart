import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double maxConsumption = 7;
  double system_consumption = 3.4;
  double system_charging = 3.5;

  @override
  Widget build(BuildContext context) {
    double currentConsumption = system_consumption / 7;
    double currentCharging = system_charging / 7;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: Container(
            width: 180,
            child: Image.asset(
              "assets/images/Header-Logo.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).primaryColorLight,
        ),
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Charging:",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: currentCharging,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
              Text(
                "Consumption:",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: currentConsumption,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      height: 40,
                      decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //   begin: Alignment.center,
                          //   end: Alignment.bottomRight,
                          //   colors: [
                          //     Theme.of(context).accentColor,
                          //     Colors.red,
                          //   ],
                          //   stops: [0, currentConsumption - currentCharging],
                          // ),
                          color: currentConsumption >= currentCharging
                              ? Colors.red
                              : Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
