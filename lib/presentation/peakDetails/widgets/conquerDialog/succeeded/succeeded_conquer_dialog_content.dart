import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SucceededConquerDialogContent extends StatelessWidget {
  const SucceededConquerDialogContent({required this.peakName, super.key});

  final String peakName;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(l10n.youHaveConqueredPeak, style: AppTextStyles.h3()),
        Text(peakName, style: AppTextStyles.h1()),
        const SizedBox(height: 16),
        Text(
          l10n.youHaveConqueredPeakDescription,
          style: AppTextStyles.h7(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
