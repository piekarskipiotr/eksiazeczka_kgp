import 'package:eksiazeczka_kgp/presentation/more/bloc/more_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/more/view/more_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<MoreBloc>(),
      child: const MoreView(),
    );
  }
}
