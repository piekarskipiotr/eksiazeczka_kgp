import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/bloc/peak_details_bloc.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/view/peak_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PeakDetailsPage extends StatelessWidget {
  const PeakDetailsPage({required this.peak, super.key});

  final Peak peak;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PeakDetailsBloc(
        peak: peak,
        authService: context.read(),
        supabasePeaksUserMetadataRepository: context.read(),
        supabaseStorageRepository: context.read(),
      ),
      child: const CupertinoScaffold(body: PeakDetailsView()),
    );
  }
}
