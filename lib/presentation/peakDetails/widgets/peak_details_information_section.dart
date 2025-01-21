import 'package:eksiazeczka_kp/designSystem/textStyles/text_styles.dart';
import 'package:flutter/material.dart';

class PeakDetailsInformationSection extends StatelessWidget {
  const PeakDetailsInformationSection({
    required this.label,
    required this.description,
    this.extraContent,
    super.key,
  });

  final String label;
  final String description;
  final List<Widget>? extraContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.h4()),
          Text(description, style: AppTextStyles.h7()),
          ...[...?extraContent],
        ],
      ),
    );
  }
}
