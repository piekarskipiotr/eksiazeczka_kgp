import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class PeakDetailsBaseInformationChip extends StatelessWidget {
  const PeakDetailsBaseInformationChip({required this.label, required this.iconPath, super.key});

  final String label;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return AppChip(label: label, iconPath: iconPath, size: ChipSize.large);
  }
}
