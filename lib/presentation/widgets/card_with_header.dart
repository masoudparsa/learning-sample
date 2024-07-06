import 'package:flutter/material.dart';

class CardWithHeaderWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const CardWithHeaderWidget(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title),
            const SizedBox(
              height: 16,
            ),
            child
          ],
        ),
      ),
    );
  }
}
