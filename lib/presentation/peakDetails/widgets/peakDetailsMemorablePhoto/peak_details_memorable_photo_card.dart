import 'dart:math';

import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/peakDetailsMemorablePhotoDialog/peak_details_memorable_photo_dialog.dart';
import 'package:flutter/material.dart';

class PeakDetailsMemorablePhotoCard extends StatelessWidget {
  const PeakDetailsMemorablePhotoCard({
    required this.peakId,
    this.width = 200,
    this.height = 240,
    this.enableOnPressed = true,
    super.key,
  });

  final String peakId;
  final double width;
  final double height;
  final bool enableOnPressed;

  void _onCardPressed(BuildContext context, String peakId) {
    PeakDetailsMemorablePhotoDialog.show(context, peakId: peakId);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / -24,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 32),
                child: LocalMemorablePeakImage(peakId: peakId),
              ),
            ),
            if (enableOnPressed)
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      _onCardPressed(context, peakId);
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
