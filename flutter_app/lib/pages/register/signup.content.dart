import 'package:flutter/material.dart';
import 'package:flutter_app/models/exception.model.dart';
import 'package:flutter_app/providers/auth.provider.dart';
import 'package:flutter_app/widgets/costumed.button.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

Map userTypes = {"controller": "controller", "viewer": "viewer"};

class _SignUpState extends State<SignUp> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  final _form = GlobalKey<FormState>();
  String? errMessage;
  String _userType = userTypes["viewer"];
  bool successful = true;

  Future submit(email, password, userType, context) async {
    try {
      setState(() {
        errMessage = null;
      });
      await Provider.of<Auth>(context, listen: false)
          .signUp(email, password, userType, context);

      Navigator.popAndPushNamed(context, "/landing");
    } on HttpException catch (e) {
      if (e.toString().contains("duplicate")) {
        errMessage = "Email already taken";
      }
      errMessage = "Sorry, somethin went wrong";
      setState(() {
        errMessage;
        successful = true;
      });
    }
  }

  bool validated() {
    return _form.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return successful
        ? Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Form(
                  key: _form,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextFormField(
                            controller: _email,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter email";
                              }
                              if (!value.contains("@")) {
                                return "Not a valid email";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text(
                                "Email",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _password,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter password";
                              }
                              if (value.length < 10) {
                                return "Should be minimum 10 characters";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text(
                                "Password",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _confirm,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please confirm password";
                              }
                              if (value != _password.text) {
                                return "Doesn't match password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text(
                                "Confirm Password",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
                if (errMessage != null)
                  Text(
                    errMessage!,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                Column(children: [
                  ListTile(
                    title: Text("Controller"),
                    leading: Radio(
                      value: userTypes["controller"],
                      groupValue: _userType,
                      onChanged: (value) {
                        setState(() {
                          _userType = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Viewer"),
                    leading: Radio(
                      value: userTypes["viewer"],
                      groupValue: _userType,
                      onChanged: (value) {
                        setState(() {
                          _userType = value;
                        });
                      },
                    ),
                  ),
                ]),
                CostumedButton(
                  height: 60,
                  width: double.infinity,
                  raduis: 15,
                  background: Theme.of(context).primaryColor,
                  text: "SIGN UP",
                  onPressed: () {
                    setState(() {
                      successful = false;
                    });

                    submit(_email.text, _password.text, _userType, context);
                  },
                ),
              ],
            ),
          )
        : CircularProgressIndicator();
  }
}
