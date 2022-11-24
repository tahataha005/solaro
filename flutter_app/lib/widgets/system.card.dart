import 'package:flutter/material.dart';

class SystemCard extends StatelessWidget {
  final system;
  final items;
  final onTap;
  final leadingColor;

  SystemCard({
    required this.system,
    required this.items,
    required this.leadingColor,
    this.onTap = null,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell();
  }
}
