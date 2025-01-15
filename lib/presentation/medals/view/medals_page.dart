import 'package:eksiazeczka_kgp/presentation/medals/bloc/medals_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/medals/view/medals_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedalsPage extends StatelessWidget {
  const MedalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<MedalsBloc>(),
      child: const MedalsView(),
    );
  }
}
