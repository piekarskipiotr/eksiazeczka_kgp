import 'package:eksiazeczka_kgp/presentation/root/view/root_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatelessWidget {
  const RootPage({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return RootView(navigationShell: navigationShell);
  }
}
