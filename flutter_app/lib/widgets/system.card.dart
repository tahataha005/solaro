import 'package:flutter/material.dart';

class SystemCard extends StatelessWidget {
  final system;
  final items;
  final onTap;
  final leadingColor;

  SystemCard({
    required this.system,
    required this.items,
    required this.leadingColor,
    this.onTap = null,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).accentColor,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
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
                color: leadingColor,
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
                    items,
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
}
