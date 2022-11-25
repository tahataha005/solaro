import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String text;
  bool selected;
  final onPressed;

  DrawerButton({
    required this.text,
    required this.selected,
    this.onPressed = null,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
