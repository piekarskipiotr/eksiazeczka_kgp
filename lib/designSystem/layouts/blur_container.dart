import 'dart:ui';

import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    required this.child,
    this.radius,
    this.outerPadding,
    this.innerPadding,
    this.onPressed,
    this.gradientColors,
    super.key,
  });

  final Widget child;
  final double? radius;
  final EdgeInsets? outerPadding;
  final EdgeInsets? innerPadding;
  final VoidCallback? onPressed;
  final List<Color>? gradientColors;

  EdgeInsets get _outerPadding => outerPadding ?? EdgeInsets.zero;

  EdgeInsets get _innerPadding => innerPadding ?? EdgeInsets.zero;

  double get _radius => radius ?? 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _outerPadding,
      child: _inkWell(
        radius: _radius,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: Stack(
            children: [
              _blurBackground(_radius, gradientColors),
              _child(child, _radius, _innerPadding),
            ],
          ),
        ),
      ),
    );
  }

  Widget _child(Widget child, double radius, EdgeInsets padding) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: AppColors.transparent,
      ),
      padding: padding,
      child: child,
    );
  }

  Widget _blurBackground(double radius, List<Color>? colors) {
    const sigma = 6.0;
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              colors: colors ??
                  [
                    Colors.grey[500]!.withValues(alpha: 0.6),
                    Colors.grey[700]!.withValues(alpha: 0.4),
                  ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inkWell({required Widget child, required double radius}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(onTap: onPressed, child: child),
      ),
    );
  }
}
