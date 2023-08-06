import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    required this.child,
    super.key,
    this.borderRadius = 30,
    this.width = double.infinity,
    this.onPressed,
    this.gradient = const LinearGradient(
      colors: [Color(0xFFE33A61), Color(0xFFD5B51C)],
    ),
  });

  final Widget child;
  final double borderRadius;
  final double width;
  final VoidCallback? onPressed;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: gradient,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
          child: child,
        ),
      ),
    );
  }
}
