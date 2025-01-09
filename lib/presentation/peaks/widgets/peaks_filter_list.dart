import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PeaksFilterList extends StatelessWidget {
  const PeaksFilterList({required this.selectedFilter, required this.onFilterPressed, super.key});

  final PeaksFilters selectedFilter;
  final void Function(PeaksFilters filter) onFilterPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Expanded(
      child: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              spacing: 8,
              children: PeaksFilters.values.map((filter) {
                return _filterChip(
                  filter: filter,
                  selectedFilter: selectedFilter,
                  onFilterPressed: onFilterPressed,
                  l10n: l10n,
                );
              }).toList(),
            ),
          ),
          _fadeInGradient(context),
        ],
      ),
    );
  }

  Widget _filterChip({
    required PeaksFilters filter,
    required PeaksFilters selectedFilter,
    required void Function(PeaksFilters filter) onFilterPressed,
    required AppLocalizations l10n,
  }) {
    return AppFilterChip(
      label: filter.getLabel(l10n),
      isSelected: filter == selectedFilter,
      onSelected: ({required isSelected}) {
        onFilterPressed(filter);
      },
    );
  }

  Widget _fadeInGradient(BuildContext context) {
    final color = Theme.of(context).scaffoldBackgroundColor;
    final gradientColors = List.generate(
      ((1 - 0) / 0.2).round() + 1,
      (index) {
        final alpha = 0 + index * 0.2;
        return color.withValues(alpha: alpha);
      },
    );

    return Positioned.fill(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 64,
          decoration: BoxDecoration(gradient: LinearGradient(colors: gradientColors)),
        ),
      ),
    );
  }
}
