import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class MedalDialogContent extends StatelessWidget {
  const MedalDialogContent({required this.title, required this.description, super.key});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: AppTextStyles.h4(),
          textAlign: TextAlign.center,
        ),
        Text(
          description,
          style: AppTextStyles.h6(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
