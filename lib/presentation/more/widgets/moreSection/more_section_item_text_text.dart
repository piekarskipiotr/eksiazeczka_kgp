import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class MoreSectionItemTextText extends StatelessWidget {
  const MoreSectionItemTextText({
    required this.label,
    required this.text,
    this.onPressed,
    super.key,
  });

  final String label;
  final String text;
  final VoidCallback? onPressed;

  EdgeInsets get _padding => const EdgeInsets.symmetric(vertical: 16, horizontal: 16);

  @override
  Widget build(BuildContext context) {
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
                style: AppTextStyles.h7(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              flex: 2,
              child: Text(
                text,
                style: AppTextStyles.h7(color: Theme.of(context).primaryColor.withValues(alpha: 0.5)),
                textAlign: TextAlign.end,
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
