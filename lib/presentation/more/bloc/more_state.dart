part of 'more_bloc.dart';

class MoreState extends Equatable {
  const MoreState({
    this.status = MoreStateStatus.initial,
    this.error,
  });

  final MoreStateStatus status;
  final String? error;

  MoreState copyWith({
    MoreStateStatus? status,
    String? error,
  }) {
    return MoreState(
      status: status ?? this.status,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, error];
}
