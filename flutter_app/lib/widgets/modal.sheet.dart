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
          ),
          Container(
            child: Form(
              child: Column(
                children: [
                  TextFormField(),
                  TextFormField(),
                ],
              ),
            ),
          ),
          TextButton(
            child: Text(
              "ADD SYSTEM",
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
