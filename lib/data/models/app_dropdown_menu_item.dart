import 'package:flutter/material.dart';

class AppDropdownMenuItem {
  AppDropdownMenuItem({
    required this.label,
    required this.onPressed,
    this.isSelected = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  String toString() {
    return 'AppDropdownMenuItem{label: $label, onPressed: $onPressed, isSelected: $isSelected}';
  }
}
