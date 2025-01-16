import 'dart:math';

import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class PeakDetailsMemorablePhotoCard extends StatelessWidget {
  const PeakDetailsMemorablePhotoCard({required this.peakId, super.key});

  final String peakId;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / -24,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Container(
          width: 200,
          height: 240,
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 32),
            child: LocalMemorablePeakImage(peakId: peakId, width: 360, height: 360, radius: 0),
          ),
        ),
      ),
    );
  }
}
