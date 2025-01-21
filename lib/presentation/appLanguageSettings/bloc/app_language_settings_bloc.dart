import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kp/services/services.dart';
import 'package:equatable/equatable.dart';

part 'app_language_settings_event.dart';
part 'app_language_settings_state.dart';

class AppLanguageSettingsBloc extends Bloc<AppLanguageSettingsEvent, AppLanguageSettingsState> {
  AppLanguageSettingsBloc({required UserPreferencesService userPreferencesService})
      : _userPreferencesService = userPreferencesService,
        super(const AppLanguageSettingsState()) {
    on<InitializeData>(_onInitializeData);
    on<ChangeLocale>(_onChangeLocale);

    add(const InitializeData());
  }

  final UserPreferencesService _userPreferencesService;

  Future<void> _onInitializeData(InitializeData event, Emitter<AppLanguageSettingsState> emit) async {
    final locale = await _userPreferencesService.getLocale();
    emit(state.copyWith(locale: locale));
  }

  Future<void> _onChangeLocale(ChangeLocale event, Emitter<AppLanguageSettingsState> emit) async {
    final locale = event.locale;
    final activeLocale = state.locale;
    if (locale == activeLocale) return;

    await _userPreferencesService.setLocale(locale);
    emit(state.copyWith(locale: locale));
  }
}
