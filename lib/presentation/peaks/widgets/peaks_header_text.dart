import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PeaksHeaderText extends StatelessWidget {
  const PeaksHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Text(l10n.peaksPageHeader, style: AppTextStyles.h2());
  }
}
