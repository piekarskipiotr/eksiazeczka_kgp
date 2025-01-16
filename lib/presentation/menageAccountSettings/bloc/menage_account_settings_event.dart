part of 'menage_account_settings_bloc.dart';

abstract class MenageAccountSettingsEvent extends Equatable {
  const MenageAccountSettingsEvent();
}

final class DeleteAccount extends MenageAccountSettingsEvent {
  const DeleteAccount();

  @override
  List<Object?> get props => [];
}

final class SignOut extends MenageAccountSettingsEvent {
  const SignOut();

  @override
  List<Object?> get props => [];
}
