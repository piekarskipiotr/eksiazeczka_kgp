import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class MedalCardInformation extends StatelessWidget {
  const MedalCardInformation({required this.medal, super.key});

  final Medals medal;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlurContainer(
      radius: 20,
      outerPadding: const EdgeInsets.all(8),
      innerPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              medal.getLabel(l10n),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.h9(color: AppColors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
