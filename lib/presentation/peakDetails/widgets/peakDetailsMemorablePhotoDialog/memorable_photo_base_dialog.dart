import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class MemorablePhotoBaseDialog extends StatelessWidget {
  const MemorablePhotoBaseDialog({required this.child, super.key});

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
