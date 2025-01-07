import 'package:eksiazeczka_kgp/presentation/root/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootView extends StatelessWidget {
  const RootView({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: const RootAppBar(),
      body: navigationShell,
      bottomNavigationBar: RootBottomNavigationBar(navigationShell: navigationShell),
    );
  }
}
