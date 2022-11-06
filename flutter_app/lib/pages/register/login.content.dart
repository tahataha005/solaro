import 'package:flutter/material.dart';
import 'package:flutter_app/providers/user.provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/costumed.button.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final enteredEmail = TextEditingController();
  final enteredPassword = TextEditingController();
  final _form = GlobalKey<FormState>();

  void validate() => _form.currentState?.validate();

  Future submit(email, password) async {
    await Provider.of<User>(context, listen: false).login(email, password);
    Navigator.of(context).pushNamed("/landing");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  controller: enteredEmail,
                  textInputAction: TextInputAction.next,
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
            height: 70,
          ),
          CostumedButton(
            height: 60,
            width: double.infinity,
            raduis: 15,
            background: Theme.of(context).primaryColor,
            text: "LOG IN",
            onPressed: () {
              submit(enteredEmail.text, enteredPassword.text);
            },
          ),
        ],
      ),
    );
  }
}
