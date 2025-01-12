part of 'peak_details_bloc.dart';

class PeakDetailsState extends Equatable {
  const PeakDetailsState({
    required this.peak,
    this.error,
  });

  final Peak peak;
  final String? error;

  PeakDetailsState copyWith({
    Peak? peak,
    String? error,
  }) {
    return PeakDetailsState(
      peak: peak ?? this.peak,
      error: error,
    );
  }

  @override
  List<Object?> get props => [peak, error];
}
