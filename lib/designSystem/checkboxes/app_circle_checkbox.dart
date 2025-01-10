import 'package:flutter/material.dart';

class AppCircleCheckbox extends StatelessWidget {
  const AppCircleCheckbox({
    required this.isChecked,
    this.size = 16,
    super.key,
  });

  final double size;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final innerSize = size - 6;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color),
      ),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isChecked ? innerSize : 0,
          height: isChecked ? innerSize : 0,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}
