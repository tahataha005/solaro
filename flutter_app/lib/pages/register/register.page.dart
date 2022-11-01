import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import './signup.content.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: MediaQuery.of(context).size.width * 0.15,
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.36,
            child: Image.asset(
              "assets/images/Logo.png",
              fit: BoxFit.cover,
            ),
          ),
          /*Login()*/ SignUp(),
        ],
      ),
    ));
  }
}
