import 'package:flutter/material.dart';

class LabeledProgressBar extends StatelessWidget {
  final String label;
  final double progress;
  final progress_color;

  const LabeledProgressBar({
    super.key,
    required this.label,
    required this.progress,
    required this.progress_color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label:",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 40,
              width: progress * 800,
              decoration: BoxDecoration(
                color: progress_color,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
