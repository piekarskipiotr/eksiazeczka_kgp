import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AppInformation extends StatelessWidget {
  const AppInformation({
    required this.onLicensesPressed,
    required this.onAttributionsPressed,
    super.key,
  });

  final VoidCallback onLicensesPressed;
  final VoidCallback onAttributionsPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textColor = Theme.of(context).primaryColor.withValues(alpha: 0.4);
    final textStyle = AppTextStyles.h9(color: textColor);
    return Column(
      children: [
        Text('2025 Piotr Piekarski', style: textStyle),
        Text(l10n.version('1.0.1+12'), style: textStyle),
        const SizedBox(height: 4),
        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onLicensesPressed,
              child: Text(l10n.licenses, style: textStyle.copyWith(decoration: TextDecoration.underline)),
            ),
            GestureDetector(
              onTap: onAttributionsPressed,
              child: Text(l10n.attributions, style: textStyle.copyWith(decoration: TextDecoration.underline)),
            ),
          ],
        ),
      ],
    );
  }
}
