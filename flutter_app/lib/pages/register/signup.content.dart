import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          TextField(),
          TextField(),
          TextField(),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "SIGN UP",
            ),
          ),
        ],
      ),
    );
  }
}
