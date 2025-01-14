import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class MedalBaseDialog extends StatelessWidget {
  const MedalBaseDialog({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemes.dark,
      child: Scaffold(
        body: child,
        backgroundColor: AppColors.transparent,
      ),
    );
  }
}
