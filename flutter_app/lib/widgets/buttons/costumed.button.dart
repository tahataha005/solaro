import 'package:flutter/material.dart';

class CostumedButton extends StatelessWidget {
  final double height;
  final double width;
  final double raduis;
  final Color background;
  final String text;
  final onPressed;
  final textStyle;

  const CostumedButton({
    super.key,
    required this.height,
    required this.width,
    required this.raduis,
    required this.background,
    required this.text,
    this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(background),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(raduis),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ?? Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
