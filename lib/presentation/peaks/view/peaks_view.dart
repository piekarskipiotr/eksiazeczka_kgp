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
        final isLoadingPeaks = state.isLoadingPeaks;
        final selectedFilter = state.filter;
        final selectedSortType = state.sortType;

        return NestedScrollView(
          headerSliverBuilder: (_, __) {
            return [
              _sliverSpacer(height: 8),
              const PeaksHeaderText(),
              _sliverSpacer(),
              FiltersAndSortRow(
                selectedFilter: selectedFilter,
                selectedSortType: selectedSortType,
                onFilterPressed: (filter) {
                  _onFilterPressed(context, filter);
                },
                onSortTypePressed: (sortType) {
                  _onSortTypePressed(context, sortType);
                },
              ),
              _sliverSpacer(),
            ];
          },
          body: PeaksList(
            peaks: peaks,
            isLoadingPeaks: isLoadingPeaks,
            filter: selectedFilter,
            onPeakPressed: _onPeakPressed,
          ),
        );
      },
    );
  }

  Widget _sliverSpacer({double height = 16}) => SliverToBoxAdapter(child: SizedBox(height: height));
}
