import 'dart:io';

import 'package:eksiazeczka_kp/data/constants.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/presentation/more/bloc/more_bloc.dart';
import 'package:eksiazeczka_kp/presentation/more/constants/more_state_status.dart';
import 'package:eksiazeczka_kp/presentation/more/widgets/widgets.dart';
import 'package:eksiazeczka_kp/resources/resources.dart';
import 'package:eksiazeczka_kp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  void _onDarkThemePressed(BuildContext context) {
    context.read<AppRouter>().showDarkModeSettings();
  }

  void _onAppLanguagePressed(BuildContext context) {
    context.read<AppRouter>().showAppLanguageSettings();
  }

  void _onReviewAppPressed(BuildContext context) {
    final store = Platform.isIOS ? appStoreUrl : googlePlayStoreUrl;
    context.read<MoreBloc>().add(OpenLink(store));
  }

  void _onAttributionsPressed(BuildContext context) {
    context.read<AppRouter>().showAttributions();
  }

  void _onFaqPressed(BuildContext context) {
    context.read<AppRouter>().showFaq();
  }

  void _onPrivacyPolicyPressed(BuildContext context) {
    context.read<MoreBloc>().add(const OpenLink(privacyPolicyUrl));
  }

  void _onTermsOfUsePressed(BuildContext context) {
    context.read<MoreBloc>().add(const OpenLink(termsOfUseUrl));
  }

  void _handleStateStatus(BuildContext context, MoreState state) {
    switch (state.status) {
      case MoreStateStatus.signingIn:
        SignInDialog.show(context);
      case MoreStateStatus.signingInSucceeded:
      case MoreStateStatus.signingInFailed:
        if (context.canPop()) context.pop();
      case _:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 196),
      child: BlocConsumer<MoreBloc, MoreState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _handleStateStatus,
        builder: (context, state) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: Column(
              spacing: 20,
              children: [
                MoreSection(
                  label: l10n.personalization,
                  children: [
                    MoreSectionItemTextIcon(
                      label: l10n.darkMode,
                      icon: IconImages.arrowForward,
                      onPressed: () {
                        _onDarkThemePressed(context);
                      },
                    ),
                    MoreSectionItemTextIcon(
                      label: l10n.appLanguage,
                      icon: IconImages.arrowForward,
                      onPressed: () {
                        _onAppLanguagePressed(context);
                      },
                    ),
                  ],
                ),
                MoreSection(
                  label: l10n.app,
                  children: [
                    MoreSectionItemTextIcon(
                      label: l10n.addReview,
                      icon: IconImages.arrowOutward,
                      onPressed: () {
                        _onReviewAppPressed(context);
                      },
                    ),
                    MoreSectionItemTextIcon(
                      label: l10n.attributions,
                      icon: IconImages.arrowForward,
                      onPressed: () {
                        _onAttributionsPressed(context);
                      },
                    ),
                  ],
                ),
                MoreSection(
                  label: l10n.helpAndConsents,
                  children: [
                    MoreSectionItemTextIcon(
                      label: l10n.faq,
                      icon: IconImages.arrowForward,
                      onPressed: () {
                        _onFaqPressed(context);
                      },
                    ),
                    MoreSectionItemTextIcon(
                      label: l10n.privacyPolicy,
                      icon: IconImages.arrowOutward,
                      onPressed: () {
                        _onPrivacyPolicyPressed(context);
                      },
                    ),
                    MoreSectionItemTextIcon(
                      label: l10n.termsOfUse,
                      icon: IconImages.arrowOutward,
                      onPressed: () {
                        _onTermsOfUsePressed(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
