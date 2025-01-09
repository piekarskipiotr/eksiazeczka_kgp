import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/bloc/peaks_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeaksView extends StatelessWidget {
  const PeaksView({super.key});

  void _onPeakPressed(BuildContext context, Peak peak) {
    // TODO(piotr): Implement navigation to peak details
  }

  void _onFilterPressed(BuildContext context, PeaksFilters filter) {
    context.read<PeaksBloc>().add(ChangePeaksFilter(filter));
  }

  void _onSortTypePressed(BuildContext context, PeaksSortTypes sortType) {
    context.read<PeaksBloc>().add(ChangePeaksSortType(sortType));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeaksBloc, PeaksState>(
      builder: (context, state) {
        final peaks = state.sortedAndFilteredPeaks;
        final selectedFilter = state.filter;
        final selectedSortType = state.sortType;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 24,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PeaksHeaderText(),
                Row(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PeaksFilterList(
                      selectedFilter: selectedFilter,
                      onFilterPressed: (filter) {
                        _onFilterPressed(context, filter);
                      },
                    ),
                    PeaksSortTypeCircleButton(
                      selectedFilter: selectedFilter,
                      selectedSortType: selectedSortType,
                      onSortTypePressed: (sortType) {
                        _onSortTypePressed(context, sortType);
                      },
                    ),
                  ],
                ),
                PeaksList(peaks: peaks, filter: selectedFilter, onPeakPressed: _onPeakPressed),
              ],
            ),
          ),
        );
      },
    );
  }
}
