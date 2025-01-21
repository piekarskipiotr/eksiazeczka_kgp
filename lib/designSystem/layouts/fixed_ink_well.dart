import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class FixedInkWell extends StatelessWidget {
  const FixedInkWell({required this.onPressed, this.radius = 0, super.key});

  final VoidCallback onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: Material(
          color: AppColors.transparent,
          child: InkWell(onTap: onPressed),
        ),
      ),
    );
  }
}
