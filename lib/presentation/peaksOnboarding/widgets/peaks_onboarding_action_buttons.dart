import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PeaksOnboardingActionButtons extends StatelessWidget {
  const PeaksOnboardingActionButtons({required this.isProcessing, required this.onGoToAppPressed, super.key});

  final bool isProcessing;
  final VoidCallback onGoToAppPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppButton(
            label: l10n.goToApp,
            isProcessing: isProcessing,
            onPressed: onGoToAppPressed,
          ),
        ],
      ),
    );
  }
}
