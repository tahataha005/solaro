import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/register/register.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Color.fromRGBO(0, 114, 187, 1),
        accentColor: Color.fromRGBO(255, 186, 73, 1),
      ),
      home: RegisterPage(),
    );
  }
}
