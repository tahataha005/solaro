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
  final _enteredCapacitance = TextEditingController();
  final _enteredChargingPin = TextEditingController();
  final _enteredConsumptionPin = TextEditingController();
  final _form = GlobalKey<FormState>();
  String? errMessage;

  //Validation
  bool? validate() => _form.currentState?.validate();

  //Adding new system
  Future addSystem(
    userId,
    systemName,
    capacitance,
    chargingPin,
    consumptionPin,
    context,
  ) async {
    try {
      setState(() {
        errMessage = null;
      });

      //Creating a new system
      await Provider.of<Systems>(context, listen: false).addSystem(
        userId,
        systemName,
        capacitance,
        chargingPin,
        consumptionPin,
        context,
      );

      //Closing modal sheet
      Navigator.of(context).pop();
    } on HttpException catch (e) {
      //Showing error message
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
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Add Solar System",
              style: Theme.of(context).textTheme.labelMedium,
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          controller: _enteredCapacitance,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              "Capacity",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          controller: _enteredChargingPin,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Required";
                            }
                            if (value.toString().length > 3) {
                              return "Invalid";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              "Charging Pin",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          controller: _enteredConsumptionPin,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Required";
                            }
                            if (value.toString().length > 3) {
                              return "Invalid";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              "Consumption Pin",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                    addSystem(
                      userId,
                      _enteredName.text,
                      double.parse(_enteredCapacitance.text),
                      _enteredChargingPin.text,
                      _enteredConsumptionPin.text,
                      context,
                    );
                  } else {
                    Navigator.of(context).popAndPushNamed("/");
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
