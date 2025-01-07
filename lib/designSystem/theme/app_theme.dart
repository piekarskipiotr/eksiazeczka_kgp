import 'package:eksiazeczka_kgp/designSystem/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.lightBackground,
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: GoogleFonts.instrumentSansTextTheme().apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
  );

  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.black),
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.darkBackground,
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: GoogleFonts.instrumentSansTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );
}
