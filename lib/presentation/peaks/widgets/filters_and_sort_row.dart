import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/peaks_filter_list.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/peaks_sort_type_circle_button.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/pinned_sliver.dart';
import 'package:flutter/material.dart';

class FiltersAndSortRow extends StatelessWidget {
  const FiltersAndSortRow({
    required this.selectedFilter,
    required this.selectedSortType,
    required this.onFilterPressed,
    required this.onSortTypePressed,
    super.key,
  });

  final PeaksFilters selectedFilter;
  final PeaksSortTypes selectedSortType;
  final void Function(PeaksFilters filter) onFilterPressed;
  final void Function(PeaksSortTypes sortType) onSortTypePressed;

  @override
  Widget build(BuildContext context) {
    return PinnedSliver(
      child: ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PeaksFilterList(
              selectedFilter: selectedFilter,
              onFilterPressed: onFilterPressed,
            ),
            const SizedBox(width: 16),
            PeaksSortTypeCircleButton(
              selectedFilter: selectedFilter,
              selectedSortType: selectedSortType,
              onSortTypePressed: onSortTypePressed,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
