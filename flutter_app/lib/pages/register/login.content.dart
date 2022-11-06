import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../widgets/costumed.button.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final enteredEmail = TextEditingController();
  final enteredPassword = TextEditingController();

  Future login(email, password) async {
    final url = Uri.http("192.168.1.177:8000", "/auth/login");
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      final data = json.decode(response.body);
      print(data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          Form(
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
            onPressed: () {
              Navigator.popAndPushNamed(context, "/landing");
            },
          )
        ],
      ),
    );
  }
}
