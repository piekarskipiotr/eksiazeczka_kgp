part of 'medals_bloc.dart';

abstract class MedalsEvent extends Equatable {
  const MedalsEvent();
}

final class Initialize extends MedalsEvent {
  const Initialize();

  @override
  List<Object?> get props => [];
}

final class LoadPeaks extends MedalsEvent {
  const LoadPeaks(this.peaks);

  final List<Peak> peaks;

  @override
  List<Object?> get props => [peaks];
}
