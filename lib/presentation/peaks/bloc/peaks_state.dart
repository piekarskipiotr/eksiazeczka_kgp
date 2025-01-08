part of 'peaks_bloc.dart';

class PeaksState extends Equatable {
  const PeaksState({
    this.filter = PeaksFilters.all,
    this.sortType = PeaksSortTypes.alphabetical,
    this.streamSubscription,
    this.peaks,
    this.error,
  });

  final PeaksFilters filter;
  final PeaksSortTypes sortType;
  final StreamSubscription<List<Peak>>? streamSubscription;
  final List<Peak>? peaks;
  final String? error;

  PeaksState copyWith({
    PeaksFilters? filter,
    PeaksSortTypes? sortType,
    StreamSubscription<List<Peak>>? streamSubscription,
    List<Peak>? peaks,
    String? error,
  }) {
    return PeaksState(
      filter: filter ?? this.filter,
      sortType: sortType ?? this.sortType,
      streamSubscription: streamSubscription ?? this.streamSubscription,
      peaks: peaks ?? this.peaks,
      error: error,
    );
  }

  @override
  List<Object?> get props => [filter, sortType, streamSubscription, peaks, error];
}
