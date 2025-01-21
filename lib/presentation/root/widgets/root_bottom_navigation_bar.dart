import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/designSystem/design_system.dart';
import 'package:eksiazeczka_kp/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class RootBottomNavigationBar extends StatelessWidget {
  const RootBottomNavigationBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _onTabChange(StatefulNavigationShell navigationShell, int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return _bottomNavigationBarContainer(
      child: GNav(
        gap: 8,
        iconSize: 24,
        textStyle: AppTextStyles.h8(fontWeight: FontWeight.w600, color: AppColors.white),
        activeColor: AppColors.white,
        tabBackgroundColor: AppColors.accentColor,
        backgroundColor: AppColors.bottomNavigationBarColors,
        padding: const EdgeInsets.all(16),
        tabMargin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        mainAxisAlignment: MainAxisAlignment.center,
        duration: const Duration(milliseconds: 350),
        onTabChange: (index) {
          _onTabChange(navigationShell, index);
        },
        tabs: AppNavigation.values
            .map(
              (appNavigation) => _bottomNavigationTab(
                appNavigation,
                l10n: l10n,
                navigationShell: navigationShell,
              ),
            )
            .toList(),
      ),
    );
  }

  GButton _bottomNavigationTab(
    AppNavigation appNavigation, {
    required AppLocalizations l10n,
    required StatefulNavigationShell navigationShell,
  }) {
    final tabIndex = appNavigation.index;
    final currentIndex = navigationShell.currentIndex;
    final isActive = tabIndex == currentIndex;
    return GButton(
      text: appNavigation.getLabel(l10n),
      leading: AppIcon(
        isActive ? appNavigation.activeIcon : appNavigation.icon,
        color: AppColors.white,
      ),

      // Limitation of GButton doesn't allow to set icon to null
      iconColor: AppColors.transparent,
      icon: Icons.circle,
    );
  }

  Widget _bottomNavigationBarContainer({required Widget child}) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 72),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: child,
        ),
      ),
    );
  }
}
