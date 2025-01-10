part of 'app_language_settings_bloc.dart';

class AppLanguageSettingsState extends Equatable {
  const AppLanguageSettingsState({
    this.locale = 'pl',
    this.error,
  });

  final String locale;
  final String? error;

  AppLanguageSettingsState copyWith({
    String? locale,
    String? error,
  }) {
    return AppLanguageSettingsState(
      locale: locale ?? this.locale,
      error: error,
    );
  }

  @override
  List<Object?> get props => [locale, error];
}
