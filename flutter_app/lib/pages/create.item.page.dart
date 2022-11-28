import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/exception.model.dart';
import 'package:flutter_app/providers/auth.provider.dart';
import 'package:flutter_app/providers/items.provider.dart';
import 'package:flutter_app/providers/user.provider.dart';
import 'package:flutter_app/tools/image.picker.dart';
import 'package:flutter_app/widgets/buttons/costumed.button.dart';
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
  String encodedImage = "";
  Uint8List? decoded;

  Future inputImage() async {
    try {
      final imageInfo = await imagePicker();
      encodedImage = imageInfo["encoded"];

      setState(() {
        decoded = imageInfo["decoded"];
      });
    } on HttpException catch (e) {
      print(e);
    }
  }

  Future createItem(name, idealConsumption) async {
    if (!validate()) return;

    final userId = Provider.of<Auth>(context, listen: false).getUserId;
    final systemId =
        Provider.of<User>(context, listen: false).getCurrentSystemId;

    try {
      await Provider.of<Items>(context, listen: false).addItem(
          userId, name, idealConsumption, systemId, encodedImage, context);

      Navigator.of(context).pop();
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

  bool validate() {
    return _form.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
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
                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).primaryColorLight,
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        splashColor: Theme.of(context).accentColor,
                        onTap: inputImage,
                        child: SizedBox(
                          child: decoded != null
                              ? Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                      child: Image.memory(
                                        decoded!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                )
                              : Icon(Icons.add, size: 200, color: Colors.white),
                        ),
                      ),
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
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Please enter name";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _enteredIdealConsumption,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Ideal Consumption",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                validator: (value) {
                                  try {
                                    double.parse(value!);
                                  } catch (e) {
                                    return "Invalid number";
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _enteredConsumptionPin,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Consumption Pin",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Please enter name";
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _enteredControlPin,
                                decoration: InputDecoration(
                                  label: Text(
                                    "Control Pin",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Please enter name";
                                  }
                                },
                              ),
                            ),
                          ],
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
      ),
    );
  }
}
