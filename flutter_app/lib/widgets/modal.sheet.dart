import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/costumed.button.dart';

class ModalSheet extends StatefulWidget {
  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 50),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Add Solar System",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            height: 150,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Name",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Connection",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Text(
                "ADD SYSTEM",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
