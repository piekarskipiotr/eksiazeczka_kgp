part of 'root_bloc.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();
}


final class LoadConqueredPeaksCount extends RootEvent {
  const LoadConqueredPeaksCount(this.peaks);

  final List<Peak> peaks;

  @override
  List<Object?> get props => [peaks];
}
