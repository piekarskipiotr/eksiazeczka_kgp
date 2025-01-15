import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/root/bloc/root_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootAppBarPeaksCounter extends StatelessWidget {
  const RootAppBarPeaksCounter({this.size = 40, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        final conqueredPeaksCount = state.conqueredPeaksCount;
        return Container(
          height: size,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).iconTheme.color,
            borderRadius: BorderRadius.circular(size / 2),
          ),
          child: Center(
            child: Text(
              l10n.conqueredPeaks(conqueredPeaksCount, 28),
              style: AppTextStyles.h9(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
