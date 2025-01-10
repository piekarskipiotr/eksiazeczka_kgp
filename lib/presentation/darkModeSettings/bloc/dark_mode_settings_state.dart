part of 'dark_mode_settings_bloc.dart';

class DarkModeSettingsState extends Equatable {
  const DarkModeSettingsState({
    this.themeMode = ThemeMode.system,
    this.error,
  });

  final ThemeMode themeMode;
  final String? error;

  DarkModeSettingsState copyWith({
    ThemeMode? themeMode,
    String? error,
  }) {
    return DarkModeSettingsState(
      themeMode: themeMode ?? this.themeMode,
      error: error,
    );
  }

  @override
  List<Object?> get props => [themeMode, error];
}
