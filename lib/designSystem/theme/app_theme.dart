import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.black, secondary: AppColors.white),
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.lightBackground,
    iconTheme: const IconThemeData(color: AppColors.black),
    textTheme: GoogleFonts.instrumentSansTextTheme().apply(
      bodyColor: AppColors.black,
      displayColor: AppColors.black,
    ),
    chipTheme: ChipThemeData(
      selectedColor: AppColors.black,
      backgroundColor: AppColors.lightBackground,
      secondarySelectedColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: const BorderSide(),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.black,
        textStyle: AppTextStyles.h6(fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        fixedSize: const Size(300, 56),
      ).copyWith(splashFactory: InkRipple.splashFactory),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.lightBackground,
        textStyle: AppTextStyles.h6(fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        fixedSize: const Size(300, 56),
      ).copyWith(splashFactory: InkRipple.splashFactory),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.black,
        overlayColor: AppColors.transparent,
        textStyle: AppTextStyles.h6(fontWeight: FontWeight.w500),
        fixedSize: const Size(300, 24),
        padding: EdgeInsets.zero,
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white, secondary: AppColors.black),
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.darkBackground,
    iconTheme: const IconThemeData(color: AppColors.white),
    textTheme: GoogleFonts.instrumentSansTextTheme().apply(
      bodyColor: AppColors.white,
      displayColor: AppColors.white,
    ),
    chipTheme: ChipThemeData(
      selectedColor: AppColors.white,
      backgroundColor: AppColors.darkBackground,
      secondarySelectedColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: const BorderSide(color: AppColors.white),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.white,
        textStyle: AppTextStyles.h6(fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        fixedSize: const Size(300, 56),
      ).copyWith(splashFactory: InkRipple.splashFactory),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.darkBackground,
        textStyle: AppTextStyles.h6(fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        fixedSize: const Size(300, 56),
      ).copyWith(splashFactory: InkRipple.splashFactory),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
        overlayColor: AppColors.transparent,
        textStyle: AppTextStyles.h6(fontWeight: FontWeight.w500),
        fixedSize: const Size(300, 24),
        padding: EdgeInsets.zero,
      ),
    ),
  );
}
