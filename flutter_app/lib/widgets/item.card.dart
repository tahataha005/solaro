import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/costumed.button.dart';

class ItemCard extends StatelessWidget {
  final String item_name;

  ItemCard({
    required this.item_name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.height * 0.12,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/Logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item_name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  CostumedButton(
                    height: 50,
                    width: double.infinity,
                    raduis: 15,
                    background: Theme.of(context).primaryColor,
                    text: "View",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/item",
                        arguments: item_name,
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
