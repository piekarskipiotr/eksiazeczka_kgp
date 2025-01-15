part of 'medals_bloc.dart';

class MedalsState extends Equatable {
  const MedalsState({this.medals, this.error});

  final List<Medals>? medals;
  final String? error;

  MedalsState copyWith({
    List<Medals>? medals,
    String? error,
  }) {
    return MedalsState(
      medals: medals ?? this.medals,
      error: error,
    );
  }

  @override
  List<Object?> get props => [medals, error];
}
