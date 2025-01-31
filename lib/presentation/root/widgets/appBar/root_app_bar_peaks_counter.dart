import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/presentation/root/bloc/root_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootAppBarPeaksCounter extends StatelessWidget {
  const RootAppBarPeaksCounter({this.size = 40, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final secondaryColor = theme.colorScheme.secondary;
    final textStyle = AppTextStyles.h9(color: secondaryColor, fontWeight: FontWeight.w500);
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        final totalPeaks = state.totalPeaks;
        final conqueredPeaksCount = state.conqueredPeaksCount;
        return Container(
          height: size,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(size / 2),
          ),
          child: Center(
            child: Row(
              children: [
                Text(l10n.conqueredPeaks, style: textStyle),
                AnimatedFlipCounter(value: conqueredPeaksCount, textStyle: textStyle, hideLeadingZeroes: true),
                Text(l10n.conqueredPeaksOf, style: textStyle),
                Text(totalPeaks.toString(), style: textStyle),
              ],
            ),
          ),
        );
      },
    );
  }
}
