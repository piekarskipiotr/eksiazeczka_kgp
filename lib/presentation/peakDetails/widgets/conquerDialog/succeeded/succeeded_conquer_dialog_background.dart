import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class SucceededConquerDialogBackground extends StatelessWidget {
  const SucceededConquerDialogBackground({required this.assetPath, required this.url, super.key});

  final String assetPath;
  final String url;

  @override
  Widget build(BuildContext context) {
    return NetworkAssetImage(
      assetPath: assetPath,
      url: url,
      height: double.infinity,
      topLeftRadius: 0,
      topRightRadius: 0,
      bottomLeftRadius: 0,
      bottomRightRadius: 0,
    );
  }
}
