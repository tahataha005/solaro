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
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            selected
                ? Theme.of(context).primaryColor
                : Theme.of(context).cardColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: selected
                ? Theme.of(context).primaryColorLight
                : Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
