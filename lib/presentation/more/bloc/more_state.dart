part of 'more_bloc.dart';

class MoreState extends Equatable {
  const MoreState({
    this.error,
  });

  final String? error;

  MoreState copyWith({
    String? error,
  }) {
    return MoreState(
      error: error,
    );
  }

  @override
  List<Object?> get props => [error];
}
