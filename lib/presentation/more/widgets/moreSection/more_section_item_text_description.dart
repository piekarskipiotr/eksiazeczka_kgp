import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class MoreSectionItemTextDescription extends StatelessWidget {
  const MoreSectionItemTextDescription({
    required this.label,
    required this.description,
    super.key,
  });

  final String label;
  final String description;

  EdgeInsets get _padding => const EdgeInsets.symmetric(vertical: 16, horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.h7(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            description,
            maxLines: 10,
            style: AppTextStyles.h7(color: Theme.of(context).primaryColor.withValues(alpha: 0.5)),
          ),
        ],
      ),
    );
  }
}
