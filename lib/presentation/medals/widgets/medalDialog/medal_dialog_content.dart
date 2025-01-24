import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class MedalDialogContent extends StatelessWidget {
  const MedalDialogContent({required this.medal, super.key});

  final Medals medal;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      spacing: 32,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 325,
          child: ModelViewer(
            src: medal.model3d,
            cameraOrbit: '0deg 90deg auto',
            disableZoom: true,
            shadowIntensity: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 8,
            children: [
              Text(
                medal.getTitle(l10n),
                style: AppTextStyles.h4(),
                textAlign: TextAlign.center,
              ),
              Text(
                medal.getSubtitle(l10n),
                style: AppTextStyles.h6(),
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
