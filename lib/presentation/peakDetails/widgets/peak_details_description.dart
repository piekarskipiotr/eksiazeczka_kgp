import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PeakDetailsDescription extends StatelessWidget {
  const PeakDetailsDescription({required this.description, super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.description, style: AppTextStyles.h4()),
          Text(description, style: AppTextStyles.h7()),
        ],
      ),
    );
  }
}
