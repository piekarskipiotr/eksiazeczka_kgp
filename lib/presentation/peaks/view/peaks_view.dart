import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/bloc/peaks_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/widgets/widgets.dart';
import 'package:eksiazeczka_kgp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeaksView extends StatefulWidget {
  const PeaksView({super.key});

  @override
  State<PeaksView> createState() => _PeaksViewState();
}

class _PeaksViewState extends State<PeaksView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onPeakPressed(BuildContext context, Peak peak) {
    context.read<AppRouter>().showPeakDetails(peak: peak);
  }

  void _onFilterPressed(BuildContext context, PeaksFilters filter) {
    context.read<PeaksBloc>().add(ChangePeaksFilter(filter));
  }

  void _onSortTypePressed(BuildContext context, PeaksSortTypes sortType) {
    context.read<PeaksBloc>().add(ChangePeaksSortType(sortType));
  }

  void _onActiveFilterPressed() {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeaksBloc, PeaksState>(
      builder: (context, state) {
        final peaks = [...?state.sortedAndFilteredPeaks];
        final isLoadingPeaks = state.isLoadingPeaks;
        final selectedFilter = state.filter;
        final selectedSortType = state.sortType;

        return NestedScrollView(
          controller: _scrollController,
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
                onActiveFilterPressed: _onActiveFilterPressed,
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
