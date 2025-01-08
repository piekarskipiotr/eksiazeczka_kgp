import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter/material.dart';

class PeaksSortTypeCircleButton extends StatelessWidget {
  const PeaksSortTypeCircleButton(
      {required this.selectedFilter, required this.selectedSortType, required this.onSortTypePressed, super.key});

  final PeaksFilters selectedFilter;
  final PeaksSortTypes selectedSortType;
  final void Function(PeaksSortTypes sortType) onSortTypePressed;

  List<PeaksSortTypes> get _values =>
      selectedFilter == PeaksFilters.unconquered ? PeaksSortTypes.limitedValues : PeaksSortTypes.values;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Stack(
      children: [
        AppDropdownMenu(
          items: _values.map((sortType) {
            return _sortTypeMenuItem(
              sortType: sortType,
              selectedSortType: selectedSortType,
              onSortTypePressed: onSortTypePressed,
              l10n: l10n,
            );
          }).toList(),
          child: IgnorePointer(
            child: AppCircleIconButton(
              iconPath: IconImages.sort,
              size: 42,
              onPressed: () {},
            ),
          ),
        ),
        _dotIndicator(),
      ],
    );
  }

  AppDropdownMenuItem _sortTypeMenuItem({
    required PeaksSortTypes sortType,
    required PeaksSortTypes selectedSortType,
    required void Function(PeaksSortTypes sortType) onSortTypePressed,
    required AppLocalizations l10n,
  }) {
    return AppDropdownMenuItem(
      label: sortType.getLabel(l10n),
      isSelected: sortType == selectedSortType,
      onPressed: () {
        onSortTypePressed(sortType);
      },
    );
  }

  Widget _dotIndicator() {
    const size = 8.0;
    const padding = 4.0;
    return Positioned(
      top: padding,
      right: padding,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: AppColors.secondaryAccentColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
