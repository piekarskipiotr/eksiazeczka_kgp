import 'package:eksiazeczka_kgp/presentation/medals/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
      body: const MedalList(),
    );
  }

  Widget _sliverSpacer({double height = 16}) => SliverToBoxAdapter(child: SizedBox(height: height));
}
