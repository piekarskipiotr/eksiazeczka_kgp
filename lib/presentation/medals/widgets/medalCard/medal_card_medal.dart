import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class MedalCardMedal extends StatelessWidget {
  const MedalCardMedal({required this.medal, required this.isEnabled, super.key});

  final Medals medal;
  final bool isEnabled;

  List<double> get _grayscaleMatrix => [
        0.33, 0.33, 0.33, 0, 0, // Red channel
        0.33, 0.33, 0.33, 0, 0, // Green channel
        0.33, 0.33, 0.33, 0, 0, // Blue channel
        0, 0, 0, 1, 0, // Alpha channel
      ];

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: isEnabled
          ? const ColorFilter.mode(AppColors.transparent, BlendMode.dst)
          : ColorFilter.matrix(_grayscaleMatrix),
      child: Image.asset(medal.model3dImage),
    );
  }
}
