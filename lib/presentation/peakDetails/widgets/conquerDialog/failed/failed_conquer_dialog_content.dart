import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter/material.dart';

class FailedConquerDialogContent extends StatelessWidget {
  const FailedConquerDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppIcon(IconImages.locationError, size: 48),
        const SizedBox(height: 4),
        Text(
          l10n.notInPeakRange,
          style: AppTextStyles.h6(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Text(
          l10n.notInPeakRangeDescription,
          style: AppTextStyles.h8(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
