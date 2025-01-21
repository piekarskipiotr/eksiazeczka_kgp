import 'package:eksiazeczka_kp/presentation/root/bloc/root_bloc.dart';
import 'package:eksiazeczka_kp/presentation/root/view/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatelessWidget {
  const RootPage({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<RootBloc>(),
      child: RootView(navigationShell: navigationShell),
    );
  }
}
