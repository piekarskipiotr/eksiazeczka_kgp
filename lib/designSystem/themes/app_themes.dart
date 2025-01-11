import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData light = _theme(
    primary: AppColors.black,
    secondary: AppColors.white,
    scaffoldBackground: AppColors.lightBackground,
  );

  static ThemeData dark = _theme(
    primary: AppColors.white,
    secondary: AppColors.black,
    scaffoldBackground: AppColors.darkBackground,
  );

  static ThemeData _theme({required Color primary, required Color secondary, required Color scaffoldBackground}) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: primary, secondary: secondary),
      primaryColor: primary,
      scaffoldBackgroundColor: scaffoldBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackground,
        surfaceTintColor: AppColors.transparent,
        titleTextStyle: AppTextStyles.h5(color: primary),
      ),
      iconTheme: IconThemeData(color: primary),
      textTheme: GoogleFonts.instrumentSansTextTheme().apply(bodyColor: primary, displayColor: primary),
      chipTheme: AppChipsThemes.chipThemeData(primary: primary, scaffoldBackground: scaffoldBackground),
      elevatedButtonTheme: AppButtonThemes.elevatedButtonThemeData(primary: primary, secondary: secondary),
      outlinedButtonTheme: AppButtonThemes.outlinedButtonThemeData(primary: primary, secondary: secondary),
      textButtonTheme: AppButtonThemes.textButtonThemeData(primary: primary),
    );
  }
}
