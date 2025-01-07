import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class RootAppBarPeaksCounter extends StatelessWidget {
  const RootAppBarPeaksCounter({
    required this.count,
    required this.total,
    this.size = 40,
    super.key,
  });

  final int count;
  final int total;
  final double size;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      height: size,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).iconTheme.color,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Center(
        child: Text(
          l10n.conqueredPeaks(count, total),
          style: AppTextStyles.h9(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
