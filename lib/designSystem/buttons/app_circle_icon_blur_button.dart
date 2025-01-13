import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class AppCircleIconBlurButton extends StatelessWidget {
  const AppCircleIconBlurButton({
    required this.iconPath,
    required this.onPressed,
    this.iconSize = 18,
    this.size = 56,
    super.key,
  });

  final String iconPath;
  final VoidCallback onPressed;
  final double iconSize;
  final double size;

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      onPressed: onPressed,
      radius: size / 2,
      innerPadding: const EdgeInsets.all(4),
      child: AppIcon(
        iconPath,
        size: iconSize,
        color: AppColors.white,
      ),
    );
  }
}
