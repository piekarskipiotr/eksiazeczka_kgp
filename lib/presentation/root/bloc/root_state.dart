part of 'root_bloc.dart';

class RootState extends Equatable {
  const RootState({this.totalPeaks = 28, this.conqueredPeaksCount = 0, this.error});

  final int totalPeaks;
  final int conqueredPeaksCount;
  final String? error;

  RootState copyWith({
    int? conqueredPeaksCount,
    String? error,
  }) {
    return RootState(
      totalPeaks: totalPeaks,
      conqueredPeaksCount: conqueredPeaksCount ?? this.conqueredPeaksCount,
      error: error,
    );
  }

  @override
  List<Object?> get props => [totalPeaks, conqueredPeaksCount, error];
}
