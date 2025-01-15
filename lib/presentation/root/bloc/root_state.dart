part of 'root_bloc.dart';

class RootState extends Equatable {
  const RootState({this.conqueredPeaksCount = 0, this.error});

  final int conqueredPeaksCount;
  final String? error;

  RootState copyWith({
    int? conqueredPeaksCount,
    String? error,
  }) {
    return RootState(
      conqueredPeaksCount: conqueredPeaksCount ?? this.conqueredPeaksCount,
      error: error,
    );
  }

  @override
  List<Object?> get props => [conqueredPeaksCount, error];
}
