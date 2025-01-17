import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/peakDetailsMemorablePhoto/peak_details_memorable_photo_card.dart';
import 'package:flutter/material.dart';

class MemorablePhotoDialogContent extends StatelessWidget {
  const MemorablePhotoDialogContent({required this.peakId, super.key});

  final String peakId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PeakDetailsMemorablePhotoCard(
          peakId: peakId,
          width: 320,
          height: 360,
          enableOnPressed: false,
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 8,
            children: [
              Text(
                l10n.memorablePhotoDialogTitle,
                style: AppTextStyles.h4(),
                textAlign: TextAlign.center,
              ),
              Text(
                l10n.memorablePhotoDialogDescription,
                style: AppTextStyles.h7(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
