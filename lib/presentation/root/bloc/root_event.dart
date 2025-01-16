part of 'root_bloc.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();
}

final class LoadConqueredPeaksCount extends RootEvent {
  const LoadConqueredPeaksCount();

  @override
  List<Object?> get props => [];
}
