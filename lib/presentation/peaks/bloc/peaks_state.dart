part of 'peaks_bloc.dart';

class PeaksState extends Equatable {
  const PeaksState({
    this.filter = PeaksFilters.all,
    this.sortType = PeaksSortTypes.alphabetical,
    this.isLoadingPeaks = true,
    this.peaks,
    this.sortedAndFilteredPeaks,
    this.error,
  });

  final PeaksFilters filter;
  final PeaksSortTypes sortType;
  final bool isLoadingPeaks;
  final List<Peak>? peaks;
  final List<Peak>? sortedAndFilteredPeaks;
  final String? error;

  PeaksState copyWith({
    PeaksFilters? filter,
    PeaksSortTypes? sortType,
    bool? isLoadingPeaks,
    List<Peak>? peaks,
    List<Peak>? sortedAndFilteredPeaks,
    String? error,
  }) {
    return PeaksState(
      filter: filter ?? this.filter,
      sortType: sortType ?? this.sortType,
      isLoadingPeaks: isLoadingPeaks ?? this.isLoadingPeaks,
      peaks: peaks ?? this.peaks,
      sortedAndFilteredPeaks: sortedAndFilteredPeaks ?? this.sortedAndFilteredPeaks,
      error: error,
    );
  }

  @override
  List<Object?> get props => [filter, sortType, isLoadingPeaks, peaks, sortedAndFilteredPeaks, error];
}
