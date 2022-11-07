import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/costumed.button.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

enum UserType { controller, viewer }

class _SignUpState extends State<SignUp> {
  UserType? _userType = UserType.viewer;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text(
                "Email",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              label: Text(
                "Password",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              label: Text(
                "Confirm Password",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          Column(children: [
            ListTile(
              title: Text("Controller"),
              leading: Radio(
                value: UserType.controller,
                groupValue: _userType,
                onChanged: (UserType? value) {
                  setState(() {
                    _userType = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Viewer"),
              leading: Radio(
                value: UserType.viewer,
                groupValue: _userType,
                onChanged: (UserType? value) {
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
              Navigator.popAndPushNamed(context, "/landing");
            },
          ),
        ],
      ),
    );
  }
}
