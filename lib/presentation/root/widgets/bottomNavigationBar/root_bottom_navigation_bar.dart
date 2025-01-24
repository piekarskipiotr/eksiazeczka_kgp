import 'package:eksiazeczka_kp/presentation/root/widgets/bottomNavigationBar/app_g_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootBottomNavigationBar extends StatelessWidget {
  const RootBottomNavigationBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _onTabChange(StatefulNavigationShell navigationShell, int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AppGNav(
      currentIndex: navigationShell.currentIndex,
      onTabChange: (index) {
        _onTabChange(navigationShell, index);
      },
    );
  }
}
