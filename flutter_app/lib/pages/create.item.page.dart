import 'package:flutter/material.dart';
import 'package:flutter_app/models/exception.model.dart';
import 'package:flutter_app/providers/auth.provider.dart';
import 'package:flutter_app/providers/items.provider.dart';
import 'package:flutter_app/providers/user.provider.dart';
import 'package:flutter_app/widgets/costumed.button.dart';
import 'package:provider/provider.dart';

class CreateItemPage extends StatefulWidget {
  @override
  State<CreateItemPage> createState() => _CreateItemPageState();
}

class _CreateItemPageState extends State<CreateItemPage> {
  final _enteredName = TextEditingController();
  final _enteredIdealConsumption = TextEditingController();
  final _form = GlobalKey<FormState>();
  String errMessage = "";

  Future createItem(name, idealConsumption) async {
    final userId = Provider.of<Auth>(context, listen: false).getUserId;
    final systemId =
        Provider.of<User>(context, listen: false).getCurrentSystemId;

    try {
      await Provider.of<Items>(context, listen: false)
          .addItem(userId, name, idealConsumption, systemId, context);
    } on HttpException catch (e) {
      String errMessage = "Sorry, something wrong happened";

      if (e.toString().contains("Unauthorized")) {
        errMessage = "Unauthorized action, only controllers can add items";
      }

      setState(() {
        errMessage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: SizedBox(
                    child: Icon(Icons.add, size: 200, color: Colors.white),
                  ),
                ),
                if (errMessage != "")
                  Text(
                    errMessage,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _enteredName,
                        decoration: InputDecoration(
                          label: Text(
                            "Item Name",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _enteredIdealConsumption,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(
                            "Ideal Consumption",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CostumedButton(
                  height: 50,
                  width: double.infinity,
                  raduis: 15,
                  background: Theme.of(context).primaryColor,
                  text: "ADD",
                  onPressed: () {
                    createItem(_enteredName.text,
                        double.parse(_enteredIdealConsumption.text));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
