import 'package:eksiazeczka_kp/presentation/root/bloc/root_bloc.dart';
import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CelebrationAnimation extends StatelessWidget {
  const CelebrationAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        final totalPeaks = state.totalPeaks;
        final conqueredPeaks = state.conqueredPeaksCount;
        final isAllPeaksConquered = conqueredPeaks == totalPeaks;

        if (isAllPeaksConquered) return Lottie.asset(Animations.celebration, repeat: false);
        return const SizedBox.shrink();
      },
    );
  }
}
