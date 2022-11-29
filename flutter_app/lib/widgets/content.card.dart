import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final Widget content;
  const ContentCard({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).backgroundColor,
      ),
      child: content,
    );
  }
}
