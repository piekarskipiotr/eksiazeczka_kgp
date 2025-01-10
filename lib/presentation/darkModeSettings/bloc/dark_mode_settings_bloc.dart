import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/services/userPreferencesService/user_preferences_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'dark_mode_settings_event.dart';
part 'dark_mode_settings_state.dart';

class DarkModeSettingsBloc extends Bloc<DarkModeSettingsEvent, DarkModeSettingsState> {
  DarkModeSettingsBloc({required UserPreferencesService userPreferencesService})
      : _userPreferencesService = userPreferencesService,
        super(const DarkModeSettingsState()) {
    on<InitializeData>(_onInitializeData);
    on<ChangeThemeMode>(_onChangeThemeMode);

    add(const InitializeData());
  }

  final UserPreferencesService _userPreferencesService;

  Future<void> _onInitializeData(InitializeData event, Emitter<DarkModeSettingsState> emit) async {
    final themeMode = await _userPreferencesService.getThemeMode();
    emit(state.copyWith(themeMode: themeMode));
  }

  Future<void> _onChangeThemeMode(ChangeThemeMode event, Emitter<DarkModeSettingsState> emit) async {
    final themeMode = event.themeMode;
    final activeThemeMode = state.themeMode;
    if (themeMode == activeThemeMode) return;

    await _userPreferencesService.setThemeMode(themeMode);
    emit(state.copyWith(themeMode: themeMode));
  }
}
