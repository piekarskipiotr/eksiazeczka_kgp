import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PeakConqueredInformation extends StatelessWidget {
  const PeakConqueredInformation({required this.date, super.key});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final formatedDate = DateFormat('dd.MM.yyyy').format(date);
    return SafeArea(
      bottom: false,
      child: BlurContainer(
        radius: 28,
        outerPadding: const EdgeInsets.all(12),
        innerPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        gradientColors: [
          AppColors.accentColor.withValues(alpha: 0.5),
          AppColors.accentColor.withValues(alpha: 0.3),
        ],
        child: Text(l10n.conqueredAt(formatedDate), style: AppTextStyles.h9(color: AppColors.white)),
      ),
    );
  }
}
