import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String text;

  const EmptyState({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).hintColor,
          )
        ],
      ),
    );
  }
}
