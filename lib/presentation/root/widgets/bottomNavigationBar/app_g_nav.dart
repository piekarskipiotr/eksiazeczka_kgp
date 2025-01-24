import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:eksiazeczka_kp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppGNav extends StatelessWidget {
  const AppGNav({required this.currentIndex, required this.onTabChange, super.key});

  final int currentIndex;
  final void Function(int index) onTabChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final secondaryColor = theme.colorScheme.secondary;
    final tabBackgroundColor = theme.isDarkMode ? AppColors.bottomNavigationBarTabBackgroundColorDark : secondaryColor;
    final borderColor = theme.isDarkMode ? AppColors.transparent : primaryColor;
    return Container(
      color: secondaryColor,
      padding: const EdgeInsets.only(top: 8),
      child: SafeArea(
        child: GNav(
          selectedIndex: currentIndex,
          onTabChange: onTabChange,
          backgroundColor: secondaryColor,
          tabBackgroundColor: tabBackgroundColor,
          tabActiveBorder: Border.all(color: borderColor),
          gap: 8,
          textStyle: AppTextStyles.h8(fontWeight: FontWeight.w500, color: primaryColor),
          padding: const EdgeInsets.all(12),
          duration: const Duration(milliseconds: 350),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          tabs: AppNavigation.values
              .map(
                (navigation) => _appGNavTap(
                  context,
                  navigation: navigation,
                  navigationIconColor: primaryColor,
                  isActive: navigation.index == currentIndex,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  GButton _appGNavTap(
    BuildContext context, {
    required AppNavigation navigation,
    required Color navigationIconColor,
    required bool isActive,
  }) {
    final l10n = context.l10n;
    final label = navigation.getLabel(l10n);
    final navIcon = isActive ? navigation.activeIcon : navigation.icon;
    final navIconColor = isActive ? navigationIconColor : navigationIconColor.withValues(alpha: 0.6);
    return GButton(
      text: label,
      leading: AppIcon(navIcon, color: navIconColor),

      // Limitation of GButton doesn't allow to set icon to null
      iconColor: AppColors.transparent,
      icon: Icons.circle,
    );
  }
}
