import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/peaksOnboardingDialog/bloc/peaks_onboarding_dialog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeaksOnboardingDialogView extends StatelessWidget {
  const PeaksOnboardingDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: BlocBuilder<PeaksOnboardingDialogBloc, PeaksOnboardingDialogState>(
        builder: (context, state) {
          final peaks = [...?state.peaks];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(l10n.haveYouConqueredPeaksAlready, style: AppTextStyles.h3()),
                    Text(l10n.haveYouConqueredPeaksAlreadyDescription, style: AppTextStyles.h8()),
                  ],
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: peaks
                          .map(
                            (peak) => AppFilterChip(
                              label: peak.name,
                              useSelectIcon: true,
                              onSelected: ({required isSelected}) {},
                              isSelected: false,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppButton(
              label: l10n.goToApp,
              onPressed: () {},
            ),
            AppTextButton(
              label: l10n.remindMeLater,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
