part of 'peak_chip_bloc.dart';

class PeakChipState extends Equatable {
  const PeakChipState({
    required this.peak,
    this.status = PeakChipStateStatus.initial,
    this.error,
  });

  final Peak peak;
  final PeakChipStateStatus status;
  final String? error;

  PeakChipState copyWith({
    Peak? peak,
    PeakChipStateStatus? status,
    String? error,
  }) {
    return PeakChipState(
      peak: peak ?? this.peak,
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props => [peak, status, error];
}
