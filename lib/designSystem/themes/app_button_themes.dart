import 'package:eksiazeczka_kp/designSystem/textStyles/text_styles.dart';
import 'package:eksiazeczka_kp/designSystem/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtonThemes {
  static final TextStyle _textStyle = AppTextStyles.h6(fontWeight: FontWeight.w500);
  static final OutlinedBorder _shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(28));

  static Size _size({double height = 56}) => Size(300, height);

  static ElevatedButtonThemeData elevatedButtonThemeData({
    required Color primary,
    required Color secondary,
  }) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: secondary,
        backgroundColor: primary,
        textStyle: _textStyle,
        shape: _shape,
        fixedSize: _size(),
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonThemeData({required Color primary}) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        textStyle: _textStyle,
        shape: _shape,
        side: BorderSide(color: primary, width: 2),
        fixedSize: _size(),
      ),
    );
  }

  static TextButtonThemeData textButtonThemeData({required Color primary}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
        overlayColor: AppColors.transparent,
        textStyle: _textStyle,
        shape: _shape,
        fixedSize: _size(height: 24),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
