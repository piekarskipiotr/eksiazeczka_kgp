part of 'peak_details_bloc.dart';

class PeakDetailsState extends Equatable {
  const PeakDetailsState({
    required this.peak,
    this.status = PeakDetailsStateStatus.initial,
    this.error,
  });

  final Peak peak;
  final PeakDetailsStateStatus status;
  final String? error;

  PeakDetailsState copyWith({
    Peak? peak,
    PeakDetailsStateStatus? status,
    String? error,
  }) {
    return PeakDetailsState(
      peak: peak ?? this.peak,
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props => [peak, status, error];
}
