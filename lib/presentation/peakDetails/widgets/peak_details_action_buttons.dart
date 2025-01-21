import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/presentation/peakDetails/constants/peak_details_state_status.dart';
import 'package:flutter/material.dart';

class PeakDetailsActionButtons extends StatelessWidget {
  const PeakDetailsActionButtons({
    required this.status,
    required this.onMarkConquerPeakPressed,
    super.key,
  });

  final PeakDetailsStateStatus status;
  final VoidCallback onMarkConquerPeakPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: AppButton(
          label: l10n.markConquerPeak,
          isLoading: status == PeakDetailsStateStatus.validatingLocation,
          onPressed: onMarkConquerPeakPressed,
        ),
      ),
    );
  }
}
