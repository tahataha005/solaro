import 'package:flutter/material.dart';
import 'package:flutter_app/models/exception.model.dart';
import 'package:flutter_app/providers/system.provider.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/providers/user.provider.dart';
import 'package:provider/provider.dart';

class ModalSheet extends StatefulWidget {
  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  final _enteredName = TextEditingController();
  final _enteredConnection = TextEditingController();
  final _form = GlobalKey<FormState>();
  String? errMessage;

  Future addSystem(String userId, System system) async {
    try {
      setState(() {
        errMessage = null;
      });
      await Provider.of<Systems>(context, listen: false)
          .addSystem(userId, system);
      Navigator.of(context).pop();
    } on HttpException catch (e) {
      errMessage = "Sorry, something woring happened";
      if (e.toString().contains("Unauthorized")) {
        errMessage = "Unauthorized action, only controllers can add systems.";
      }

      setState(() {
        errMessage;
      });
    }
  }

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
          if (errMessage != null)
            Text(
              errMessage!,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
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
              onPressed: () {
                System system = System(
                  name: _enteredName.text,
                  connection: _enteredConnection.text,
                  consumption: 0,
                  charging: 0,
                  items: [],
                );
                String userId =
                    Provider.of<User>(context, listen: false).getUserId;
                addSystem(userId, system);
              },
            ),
          )
        ],
      ),
    );
  }
}
