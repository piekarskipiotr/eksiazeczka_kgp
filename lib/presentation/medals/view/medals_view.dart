import 'package:eksiazeczka_kp/presentation/medals/bloc/medals_bloc.dart';
import 'package:eksiazeczka_kp/presentation/medals/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedalsView extends StatelessWidget {
  const MedalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (_, __) {
        return [
          _sliverSpacer(height: 8),
          const MedalsHeaderText(),
          _sliverSpacer(height: 8),
        ];
      },
      body: BlocBuilder<MedalsBloc, MedalsState>(
        builder: (context, state) {
          final medals = [...?state.medals];
          return MedalList(medals: medals);
        },
      ),
    );
  }

  Widget _sliverSpacer({double height = 16}) => SliverToBoxAdapter(child: SizedBox(height: height));
}
