import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class TransparentFadeRoute extends PageRouteBuilder<void> {
  TransparentFadeRoute({required this.builder, this.duration = const Duration(milliseconds: 150)})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
          opaque: false,
          barrierColor: AppColors.transparent,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );

  final WidgetBuilder builder;
  final Duration duration;

  @override
  Duration get transitionDuration => duration;
}
