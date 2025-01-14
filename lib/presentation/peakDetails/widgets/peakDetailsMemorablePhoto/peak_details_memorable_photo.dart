import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/peakDetailsMemorablePhoto/peak_details_memorable_photo_card.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/peak_details_information_section.dart';
import 'package:flutter/material.dart';

class PeakDetailsMemorablePhoto extends StatelessWidget {
  const PeakDetailsMemorablePhoto({required this.peakId, super.key});

  final String peakId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PeakDetailsInformationSection(
      label: l10n.memorablePhoto,
      description: l10n.memorablePhotoDescription,
      extraContent: [
        PeakDetailsMemorablePhotoCard(peakId: peakId),
      ],
    );
  }
}
