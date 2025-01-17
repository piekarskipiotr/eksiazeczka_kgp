import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class MoreSectionItemTextIcon extends StatelessWidget {
  const MoreSectionItemTextIcon({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isDanger = false,
    super.key,
  });

  final String label;
  final String icon;
  final VoidCallback onPressed;
  final bool isDanger;

  EdgeInsets get _padding => const EdgeInsets.symmetric(vertical: 16, horizontal: 16);

  @override
  Widget build(BuildContext context) {
    final color = isDanger ? AppColors.secondaryAccentColor : null;
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: _padding,
        child: Row(
          spacing: 24,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                label,
                style: AppTextStyles.h7(color: color),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            AppIcon(icon, color: color, size: 16),
          ],
        ),
      ),
    );
  }
}
