part of 'more_bloc.dart';

abstract class MoreEvent extends Equatable {
  const MoreEvent();
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
