import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final Widget content;
  Color color;
  ContentCard({
    required this.content,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: content,
    );
  }
}
