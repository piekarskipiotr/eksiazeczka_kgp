import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter/material.dart';

class AppFilterChip extends StatelessWidget {
  const AppFilterChip({
    required this.label,
    required this.onSelected,
    required this.isSelected,
    this.useSelectIcon = false,
    this.size = ChipSize.regular,
    super.key,
  });

  final String label;
  final void Function({required bool isSelected}) onSelected;
  final bool isSelected;
  final bool useSelectIcon;
  final ChipSize size;

  TextStyle get _labelStyle => AppTextStyles.h8(fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryColor = theme.colorScheme.secondary;
    final labelStyle = isSelected
        ? _labelStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: secondaryColor,
          )
        : _labelStyle;

    return FilterChip(
      showCheckmark: false,
      selected: isSelected,
      onSelected: (isSelected) => onSelected(isSelected: isSelected),
      label: Text(label, style: labelStyle),
      labelPadding: const EdgeInsets.symmetric(horizontal: 6),
      avatar: useSelectIcon && isSelected ? AppIcon(IconImages.checkCircle, color: secondaryColor) : null,
      padding: size.padding,
    );
  }
}
