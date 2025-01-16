import 'dart:io';

import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/designSystem/shimmers/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalMemorablePeakImage extends StatelessWidget {
  const LocalMemorablePeakImage({
    required this.width,
    required this.height,
    required this.radius,
    required this.peakId,
    super.key,
  });

  final double width;
  final double height;
  final double radius;
  final String peakId;

  Future<String> _fetchLocalPeakImage(BuildContext context, {required String peakId}) async {
    final repository = context.read<StorageRepository>();
    return repository.getPeakImage(peakId: peakId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _fetchLocalPeakImage(context, peakId: peakId),
      builder: (context, snapshot) {
        if ((snapshot.connectionState == ConnectionState.waiting) || (snapshot.hasError || !snapshot.hasData)) {
          return const AppShimmer();
        }

        final imagePath = snapshot.data!;
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: SizedBox(
            height: height,
            width: width,
            child: Image.file(
              File(imagePath),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        );
      },
    );
  }
}
