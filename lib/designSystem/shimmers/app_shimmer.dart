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
      baseColor: Theme.of(context).scaffoldBackgroundColor,
      highlightColor: Theme.of(context).primaryColor,
      period: duration,
      child: child ?? Container(color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
