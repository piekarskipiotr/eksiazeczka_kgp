import 'dart:io';

import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/presentation/more/widgets/more_sign_in_card.dart';
import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  Providers get _provider => Platform.isIOS ? Providers.apple : Providers.google;

  void _onSignInPressed(BuildContext context, Providers provider) {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 196),
      child: Column(
        children: [
          MoreSignInCard(
            provider: _provider,
            onPressed: (provider) {
              _onSignInPressed(context, provider);
            },
          ),
        ],
      ),
    );
  }
}
