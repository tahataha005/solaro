import 'package:flutter/material.dart';
import '../../widgets/costumed.button.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final enteredEmail = TextEditingController();
  final enteredPassword = TextEditingController();
  var _form = GlobalKey<FormState>();

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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
