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
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.2,
                bottom: MediaQuery.of(context).size.width * 0.1,
              ),
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
                  content
                      ? "Don't have an account?"
                      : "Already have an account?",
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
                    style: const TextStyle(fontFamily: "Inter", fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
