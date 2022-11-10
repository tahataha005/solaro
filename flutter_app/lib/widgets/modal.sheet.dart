import 'package:flutter/material.dart';
import 'package:flutter_app/models/exception.model.dart';
import 'package:flutter_app/providers/systems.provider.dart';
import 'package:flutter_app/providers/auth.provider.dart';
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

  Future addSystem(
      String userId, String systemName, String systemConnection) async {
    try {
      setState(() {
        errMessage = null;
      });
      await Provider.of<Systems>(context, listen: false)
          .addSystem(userId, systemName, systemConnection, context);
      Navigator.of(context).pop();
    } on HttpException catch (e) {
      print(e);
      errMessage = "Sorry, something woring happened";
      if (e.toString().contains("Unauthorized")) {
        errMessage = "Unauthorized action, only controllers can add systems.";
      }

      setState(() {
        errMessage;
      });
    }
  }

  bool? validate() => _form.currentState?.validate();

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
          Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  controller: _enteredName,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Please enter a name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      "Name",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _enteredConnection,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Please enter a name";
                    }
                    return null;
                  },
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
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Text(
                "ADD SYSTEM",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              onPressed: () {
                if (!validate()!) {
                  return;
                }

                String? userId =
                    Provider.of<Auth>(context, listen: false).getUserId;

                if (userId != null) {
                  addSystem(userId, _enteredName.text, _enteredConnection.text);
                } else {
                  Navigator.of(context).popAndPushNamed("/");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
