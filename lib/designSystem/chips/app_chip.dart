import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    required this.label,
    this.iconPath,
    this.isFilled = false,
    this.size = ChipSize.regular,
    super.key,
  });

  final String label;
  final String? iconPath;
  final bool isFilled;
  final ChipSize size;

  TextStyle get _labelStyle => AppTextStyles.h8(fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final secondaryColor = theme.colorScheme.secondary;
    final labelStyle =
        isFilled ? _labelStyle.copyWith(color: secondaryColor) : _labelStyle.copyWith(color: primaryColor);
    final iconColor = isFilled ? secondaryColor : primaryColor;
    final backgroundColor = isFilled ? primaryColor : null;

    return Chip(
      label: Text(label, style: labelStyle),
      labelPadding: const EdgeInsets.symmetric(horizontal: 6),
      backgroundColor: backgroundColor,
      avatar: iconPath != null ? AppIcon(iconPath!, color: iconColor) : null,
      padding: size.padding,
    );
  }
}
