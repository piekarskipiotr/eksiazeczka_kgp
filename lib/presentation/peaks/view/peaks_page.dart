import 'package:eksiazeczka_kgp/presentation/peaks/bloc/peaks_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peaks/view/peaks_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeaksPage extends StatelessWidget {
  const PeaksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<PeaksBloc>(),
      child: const PeaksView(),
    );
  }
}
