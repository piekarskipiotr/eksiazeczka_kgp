part of 'more_bloc.dart';

abstract class MoreEvent extends Equatable {
  const MoreEvent();
}

final class Initialize extends MoreEvent {
  const Initialize();

  @override
  List<Object?> get props => [];
}

final class _UserUpdate extends MoreEvent {
  const _UserUpdate(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

final class SignInWithProvider extends MoreEvent {
  const SignInWithProvider(this.provider);

  final Providers provider;

  @override
  List<Object?> get props => [provider];
}

final class UpdateProfilePicture extends MoreEvent {
  const UpdateProfilePicture();

  @override
  List<Object?> get props => [];
}

final class OpenLink extends MoreEvent {
  const OpenLink(this.url);

  final String url;

  @override
  List<Object?> get props => [url];
}
