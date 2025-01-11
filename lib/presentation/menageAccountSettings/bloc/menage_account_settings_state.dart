part of 'menage_account_settings_bloc.dart';

class MenageAccountSettingsState extends Equatable {
  const MenageAccountSettingsState({
    this.status = MenageAccountSettingsStateStatus.initial,
    this.user,
    this.error,
  });

  final MenageAccountSettingsStateStatus status;
  final User? user;
  final String? error;

  MenageAccountSettingsState copyWith({
    MenageAccountSettingsStateStatus? status,
    User? user,
    String? error,
  }) {
    return MenageAccountSettingsState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, user, error];
}
