part of 'more_bloc.dart';

abstract class MoreEvent extends Equatable {
  const MoreEvent();
}

final class OpenLink extends MoreEvent {
  const OpenLink(this.url);

  final String url;

  @override
  List<Object?> get props => [url];
}
