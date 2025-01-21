import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PeaksHeaderText extends StatelessWidget {
  const PeaksHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          l10n.peaksPageHeader,
          style: AppTextStyles.h2(),
        ),
      ),
    );
  }
}
