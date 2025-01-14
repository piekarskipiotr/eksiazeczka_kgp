import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class MedalsHeaderText extends StatelessWidget {
  const MedalsHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          l10n.medalsPageHeader,
          style: AppTextStyles.h2(),
        ),
      ),
    );
  }
}
