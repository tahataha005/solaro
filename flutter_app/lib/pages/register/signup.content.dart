import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          TextField(
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
          TextField(
            decoration: InputDecoration(
              label: Text(
                "Password",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text(
                "Confirm Password",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "SIGN UP",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
