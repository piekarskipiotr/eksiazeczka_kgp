import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class MoreSectionItemCheckboxText extends StatelessWidget {
  const MoreSectionItemCheckboxText({
    required this.label,
    required this.isChecked,
    required this.onPressed,
    super.key,
  });

  final String label;
  final bool isChecked;
  final VoidCallback onPressed;

  EdgeInsets get _padding => const EdgeInsets.symmetric(vertical: 16, horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: _padding,
        child: Row(
          spacing: 8,
          children: [
            AppCircleCheckbox(isChecked: isChecked),
            Flexible(
              child: Text(
                label,
                style: AppTextStyles.h7(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
