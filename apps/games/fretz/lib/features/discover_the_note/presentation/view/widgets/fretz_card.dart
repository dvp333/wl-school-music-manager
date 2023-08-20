import 'package:flutter/material.dart';
import 'package:fretz/core/design_system/fretz_colors.dart';

class FretzCard extends StatelessWidget {
  const FretzCard({
    super.key,
    required this.title,
    required this.content,
    required this.complement,
  });

  final String title;
  final String content;
  final String complement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [FretzColors.yellowGradient, FretzColors.redGradient],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 2,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  content,
                  style: const TextStyle(fontSize: 48),
                ),
                const SizedBox(width: 5),
                Text(
                  complement,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
