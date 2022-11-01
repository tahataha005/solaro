import 'package:flutter/material.dart';
import './login.content.dart';
import './signup.content.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool content = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        // vertical: MediaQuery.of(context).size.width * 0.2,
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.2),
            child: Image.asset(
              "assets/images/Logo.png",
              fit: BoxFit.cover,
            ),
          ),
          content ? Login() : SignUp(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content ? "Don't have an account?" : "Already have an account?",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    content = !content;
                  });
                },
                child: Text(
                  content ? "Sign Up" : "Log In",
                  style: TextStyle(fontFamily: "Inter", fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
