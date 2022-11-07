import 'package:flutter/material.dart';
import 'package:flutter_app/providers/user.provider.dart';
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
  String _userType = userTypes["viewer"];

  Future submit(email, password, userType) async {
    await Provider.of<User>(context, listen: false)
        .signUp(email, password, userType);
    Navigator.popAndPushNamed(context, "/landing");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Form(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: _email,
                      textInputAction: TextInputAction.next,
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
              submit(_email.text, _password.text, _userType);
            },
          ),
        ],
      ),
    );
  }
}
