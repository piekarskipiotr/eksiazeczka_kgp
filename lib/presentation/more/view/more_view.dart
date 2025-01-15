import 'dart:io';

import 'package:eksiazeczka_kgp/data/constants.dart';
import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/more/bloc/more_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/more/constants/more_state_status.dart';
import 'package:eksiazeczka_kgp/presentation/more/widgets/widgets.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:eksiazeczka_kgp/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  Providers get _provider => Platform.isIOS ? Providers.apple : Providers.google;

  void _onSignInPressed(BuildContext context, Providers provider) {
    context.read<MoreBloc>().add(SignInWithProvider(provider));
  }

  void _onDarkThemePressed(BuildContext context) {
    context.read<AppRouter>().showDarkModeSettings();
  }

  void _onAppLanguagePressed(BuildContext context) {
    context.read<AppRouter>().showAppLanguageSettings();
  }

  void _onMenageAccountPressed(BuildContext context, User? user) {
    if (user == null) return;
    context.read<AppRouter>().showManageAccount(user: user);
  }

  void _onReviewAppPressed(BuildContext context) {
    final store = Platform.isIOS ? appStoreUrl : googlePlayStoreUrl;
    context.read<MoreBloc>().add(OpenLink(store));
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 196),
      child: BlocConsumer<MoreBloc, MoreState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _handleStateStatus,
        builder: (context, state) {
          final user = state.user;
          final isSignedUser = !(user?.isAnonymous ?? true);
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: Column(
              spacing: 20,
              children: [
                if (!isSignedUser)
                  MoreSignInCard(
                    provider: _provider,
                    onPressed: (provider) {
                      _onSignInPressed(context, provider);
                    },
                  ),
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
                if (isSignedUser)
                  MoreSection(
                    label: l10n.account,
                    children: [
                      MoreSectionItemTextIcon(
                        label: l10n.menageAccount,
                        icon: IconImages.arrowForward,
                        onPressed: () {
                          _onMenageAccountPressed(context, user);
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
