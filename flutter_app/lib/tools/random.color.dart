import 'package:flutter/material.dart';

Color randColor(String? name, context) {
  int countName = name!.length;
  while (countName >= 3) {
    countName = countName % 3;
  }
  List colors = [
    Theme.of(context).primaryColor,
    Theme.of(context).accentColor,
    Colors.blueGrey,
  ];
  return colors[countName];
}
