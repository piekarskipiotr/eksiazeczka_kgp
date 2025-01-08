import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class AppDropdownMenuEntry extends StatelessWidget {
  const AppDropdownMenuEntry({required this.menuItem, super.key});

  final AppDropdownMenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        Flexible(
          child: Text(
            menuItem.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.h8(color: AppColors.white),
          ),
        ),
        if (menuItem.isSelected) _dotIndicator(),
      ],
    );
  }

  Widget _dotIndicator() {
    const size = 4.0;
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.secondaryAccentColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
