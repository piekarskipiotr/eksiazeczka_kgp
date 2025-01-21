import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PeaksOnboardingHeader extends StatelessWidget {
  const PeaksOnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.haveYouConqueredPeaksAlready, style: AppTextStyles.h3(fontWeight: FontWeight.bold)),
        Text(l10n.haveYouConqueredPeaksAlreadyDescription, style: AppTextStyles.h7()),
      ],
    );
  }
}
