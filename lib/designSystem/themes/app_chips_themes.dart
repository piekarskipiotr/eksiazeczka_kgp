import 'package:flutter/material.dart';

class AppChipsThemes {
  static ChipThemeData chipThemeData({required Color primary, required Color scaffoldBackground}) {
    return ChipThemeData(
      backgroundColor: scaffoldBackground,
      color: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) return primary;
        return scaffoldBackground;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48),
        side: BorderSide(color: primary),
      ),
    );
  }
}
