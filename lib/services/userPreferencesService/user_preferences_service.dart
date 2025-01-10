import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferencesService {
  UserPreferencesService() {
    _init();
  }

  static const String _themeModeKey = 'themeModeKey';
  static const String _localeKey = 'localeKey';

  late SharedPreferences? _instance;

  Future<void> _init() async {
    _instance = await SharedPreferences.getInstance();
  }

  Future<ThemeMode> getThemeMode() async {
    final themeIndex = _instance!.getInt(_themeModeKey) ?? 0;
    return ThemeMode.values[themeIndex];
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _instance!.setInt(_themeModeKey, themeMode.index);
  }

  Future<String> getLocale() async {
    final locale = _instance!.getString(_localeKey) ?? 'pl';
    return locale;
  }

  Future<void> setLocale(String locale) async {
    await _instance!.setString(_localeKey, locale);
  }
}
