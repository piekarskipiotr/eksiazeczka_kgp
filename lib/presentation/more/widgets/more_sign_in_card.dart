import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/utils/utils.dart';
import 'package:flutter/material.dart';

class MoreSignInCard extends StatelessWidget {
  const MoreSignInCard({required this.provider, required this.onPressed, super.key});

  final Providers provider;
  final void Function(Providers provider) onPressed;

  double get _radius => 26;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final backgroundColor = theme.primaryColor;
    final textColor = theme.colorScheme.secondary;
    final iconColor = provider == Providers.apple ? textColor : null;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(_radius)),
          ),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.signInCardTitle, style: AppTextStyles.h4(color: textColor, fontWeight: FontWeight.bold)),
                  Text(
                    l10n.signInCardDescription,
                    style: AppTextStyles.h8(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 8,
                children: [
                  AppIcon(provider.icon, size: 18, color: iconColor),
                  Text(
                    l10n.signInWith(provider.name.capitalizeFirst),
                    style: AppTextStyles.h6(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        FixedInkWell(
          radius: _radius,
          onPressed: () {
            onPressed(provider);
          },
        ),
      ],
    );
  }
}
