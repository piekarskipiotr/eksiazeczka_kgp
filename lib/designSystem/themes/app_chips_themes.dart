import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class AppChipsThemes {
  static ChipThemeData chipThemeData({required Color primary, required Color scaffoldBackground}) {
    return ChipThemeData(
      color: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) return primary;
        return scaffoldBackground;
      }),
      labelStyle: AppTextStyles.h8(color: primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48),
        side: BorderSide(color: primary),
      ),
    );
  }
}
