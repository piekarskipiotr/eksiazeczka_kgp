part of 'dark_mode_settings_bloc.dart';

abstract class DarkModeSettingsEvent extends Equatable {
  const DarkModeSettingsEvent();
}

final class InitializeData extends DarkModeSettingsEvent {
  const InitializeData();

  @override
  List<Object?> get props => [];
}

final class ChangeThemeMode extends DarkModeSettingsEvent {
  const ChangeThemeMode(this.themeMode);

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
}
