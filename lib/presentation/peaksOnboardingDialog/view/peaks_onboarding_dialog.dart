import 'package:eksiazeczka_kgp/presentation/peaksOnboardingDialog/bloc/peaks_onboarding_dialog_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peaksOnboardingDialog/view/peaks_onboarding_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class _PeaksOnboardingDialog extends StatelessWidget {
  const _PeaksOnboardingDialog();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PeaksOnboardingDialogBloc(peaksRepository: context.read()),
      child: const PeaksOnboardingDialogView(),
    );
  }
}

class PeaksOnboardingDialog {
  static void show(BuildContext context) {
    CupertinoScaffold.showCupertinoModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isDismissible: false,
      enableDrag: false,
      builder: (context) => const _PeaksOnboardingDialog(),
    );
  }
}
