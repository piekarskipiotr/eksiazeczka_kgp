part of 'app_language_settings_bloc.dart';

abstract class AppLanguageSettingsEvent extends Equatable {
  const AppLanguageSettingsEvent();
}

final class InitializeData extends AppLanguageSettingsEvent {
  const InitializeData();

  @override
  List<Object?> get props => [];
}

final class ChangeLocale extends AppLanguageSettingsEvent {
  const ChangeLocale(this.locale);

  final String locale;

  @override
  List<Object?> get props => [locale];
}
