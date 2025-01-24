import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({
    this.duration = const Duration(milliseconds: 1000),
    this.child,
    super.key,
  });

  final Duration duration;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: duration,
      baseColor: AppColors.black.withValues(alpha: 0.1),
      highlightColor: Theme.of(context).scaffoldBackgroundColor,
      child: child ?? Container(color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
