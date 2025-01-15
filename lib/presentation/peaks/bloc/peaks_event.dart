part of 'peaks_bloc.dart';

abstract class PeaksEvent extends Equatable {
  const PeaksEvent();
}

final class LoadPeaks extends PeaksEvent {
  const LoadPeaks(this.peaks);

  final List<Peak> peaks;

  @override
  List<Object?> get props => [peaks];
}

final class ChangePeaksFilter extends PeaksEvent {
  const ChangePeaksFilter(this.filter);

  final PeaksFilters filter;

  @override
  List<Object?> get props => [filter];
}

final class ChangePeaksSortType extends PeaksEvent {
  const ChangePeaksSortType(this.sortType);

  final PeaksSortTypes sortType;

  @override
  List<Object?> get props => [sortType];
}
