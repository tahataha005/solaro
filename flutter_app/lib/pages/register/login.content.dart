import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth.provider.dart';
import 'package:flutter_app/providers/user.provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/costumed.button.dart';
import '../../models/exception.model.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final enteredEmail = TextEditingController();
  final enteredPassword = TextEditingController();
  final _form = GlobalKey<FormState>();
  String err = "";
  bool successful = true;

  void validate() => _form.currentState?.validate();

  Future submit(email, password) async {
    try {
      setState(() {
        err = "";
      });
      await Provider.of<Auth>(context, listen: false).login(email, password);

      String? userId = Provider.of<Auth>(context, listen: false).getUserId;

      if (userId != null) {
        await Provider.of<User>(context, listen: false)
            .getUser(userId, context);

        Navigator.of(context).popAndPushNamed("/landing");
      }
    } on HttpException catch (error) {
      setState(() {
        err = error.message;
        successful = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return successful
        ? Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: enteredEmail,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter field";
                          }
                          if (!value.contains("@")) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) {
                          validate();
                        },
                        decoration: InputDecoration(
                          label: Text(
                            "Email",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextFormField(
                        controller: enteredPassword,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter field";
                          }
                          return null;
                        },
                        onFieldSubmitted: (_) {
                          validate();
                        },
                        decoration: InputDecoration(
                          label: Text(
                            "Password",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  err,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 70,
                ),
                CostumedButton(
                  height: 60,
                  width: double.infinity,
                  raduis: 15,
                  background: Theme.of(context).primaryColor,
                  text: "LOG IN",
                  onPressed: () {
                    setState(() {
                      successful = false;
                    });
                    submit(enteredEmail.text, enteredPassword.text);
                  },
                ),
              ],
            ),
          )
        : CircularProgressIndicator();
  }
}
