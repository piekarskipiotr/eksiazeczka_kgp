part of 'more_bloc.dart';

class MoreState extends Equatable {
  const MoreState({
    this.status = MoreStateStatus.initial,
    this.user,
    this.error,
  });

  final MoreStateStatus status;
  final User? user;
  final String? error;

  MoreState copyWith({
    MoreStateStatus? status,
    User? user,
    String? error,
  }) {
    return MoreState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, user, error];
}
