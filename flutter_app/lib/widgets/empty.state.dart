import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String text;

  EmptyState({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: Image.asset(
                    "assets/images/Logo-Only.png",
                  ),
                ),
                Text(
                  text,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
