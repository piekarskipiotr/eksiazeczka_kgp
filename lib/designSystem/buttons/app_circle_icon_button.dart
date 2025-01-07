import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class AppCircleIconButton extends StatelessWidget {
  const AppCircleIconButton({
    required this.iconPath,
    required this.onPressed,
    this.iconSize = 24,
    this.size = 56,
    super.key,
  });

  final String iconPath;
  final VoidCallback onPressed;
  final double iconSize;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: theme.elevatedButtonTheme.style?.copyWith(
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        shape: const WidgetStatePropertyAll(CircleBorder()),
        minimumSize: WidgetStatePropertyAll(Size(size, size)),
        maximumSize: WidgetStatePropertyAll(Size(size, size)),
        fixedSize: WidgetStatePropertyAll(Size(size, size)),
      ),
      onPressed: onPressed,
      child: AppIcon(
        iconPath,
        size: iconSize,
        color: theme.colorScheme.secondary,
      ),
    );
  }
}
