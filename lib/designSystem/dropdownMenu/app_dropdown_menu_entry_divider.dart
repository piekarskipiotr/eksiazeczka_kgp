import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class AppDropdownMenuEntryDivider extends StatelessWidget {
  const AppDropdownMenuEntryDivider({required this.height, super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.white, height: height);
  }
}
