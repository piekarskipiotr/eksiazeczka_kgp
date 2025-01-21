import 'package:eksiazeczka_kp/data/models/peak.dart';
import 'package:eksiazeczka_kp/presentation/peaksOnboarding/widgets/peakChip/view/peak_chip.dart';
import 'package:flutter/material.dart';

class PeaksOnboardingList extends StatelessWidget {
  const PeaksOnboardingList({required this.peaks, required this.onProcessingChange, super.key});

  final List<Peak> peaks;
  final void Function({required String peakId, required bool isProcessing}) onProcessingChange;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 124),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: peaks.map((peak) => PeakChip(peak: peak, onProcessingChange: onProcessingChange)).toList(),
        ),
      ),
    );
  }
}
