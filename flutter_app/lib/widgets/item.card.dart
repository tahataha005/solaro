import 'package:flutter/material.dart';
import 'package:flutter_app/config/request.config.dart';
import 'package:flutter_app/widgets/buttons/costumed.button.dart';

class ItemCard extends StatelessWidget {
  final String item_name;
  final String item_id;

  ItemCard({
    required this.item_name,
    required this.item_id,
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
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "http://${RequestConfig.url}/images/${item_id}.png"))),
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
                    height: 40,
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
