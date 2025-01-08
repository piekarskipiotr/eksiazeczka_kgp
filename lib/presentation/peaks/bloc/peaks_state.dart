part of 'peaks_bloc.dart';

class PeaksState extends Equatable {
  const PeaksState({
    this.filter = PeaksFilters.all,
    this.sortType = PeaksSortTypes.alphabetical,
    this.error,
  });

  final PeaksFilters filter;
  final PeaksSortTypes sortType;
  final String? error;

  PeaksState copyWith({
    PeaksFilters? filter,
    PeaksSortTypes? sortType,
    String? error,
  }) {
    return PeaksState(
      filter: filter ?? this.filter,
      sortType: sortType ?? this.sortType,
      error: error,
    );
  }

  @override
  List<Object?> get props => [filter, sortType, error];
}
