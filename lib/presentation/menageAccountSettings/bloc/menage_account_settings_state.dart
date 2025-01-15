part of 'menage_account_settings_bloc.dart';

class MenageAccountSettingsState extends Equatable {
  const MenageAccountSettingsState({
    required this.user,
    this.status = MenageAccountSettingsStateStatus.initial,
    this.error,
  });

  final MenageAccountSettingsStateStatus status;
  final User user;
  final String? error;

  MenageAccountSettingsState copyWith({
    MenageAccountSettingsStateStatus? status,
    String? error,
  }) {
    return MenageAccountSettingsState(
      status: status ?? this.status,
      user: user,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, user, error];
}
