import 'package:eksiazeczka_kp/presentation/peaksOnboarding/bloc/peaks_onboarding_bloc.dart';
import 'package:eksiazeczka_kp/presentation/peaksOnboarding/view/peaks_onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PeaksOnboardingPage extends StatelessWidget {
  const PeaksOnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PeaksOnboardingBloc(
        peaksRepository: context.read(),
        analyticsService: context.read(),
        userPreferencesService: context.read(),
      ),
      child: const CupertinoScaffold(body: PeaksOnboardingView()),
    );
  }
}
