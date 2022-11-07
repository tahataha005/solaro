import 'package:flutter/material.dart';

class ModalSheet extends StatefulWidget {
  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  final _enteredName = TextEditingController();
  final _enteredConnection = TextEditingController();
  final _form = GlobalKey<FormState>();

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
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    controller: _enteredName,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text(
                        "Name",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _enteredConnection,
                    textInputAction: TextInputAction.next,
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
