import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({required this.filter, super.key});

  final PeaksFilters filter;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final (icon, title, description) = filter.getEmptyState(l10n);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon(icon, size: 32),
          const SizedBox(height: 8),
          Text(title, style: AppTextStyles.h7(), textAlign: TextAlign.center),
          Text(description, style: AppTextStyles.h9(), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
