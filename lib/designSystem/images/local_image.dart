import 'dart:io';

import 'package:eksiazeczka_kgp/data/repositories/offlineOnline/storage_repository.dart';
import 'package:eksiazeczka_kgp/designSystem/shimmers/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalImage extends StatelessWidget {
  const LocalImage({
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: context.read<StorageRepository>().getPeakImage(peakId: peakId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppShimmer();
        } else if (snapshot.hasError || !snapshot.hasData) {
          return const AppShimmer();
        } else {
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
        }
      },
    );
  }
}
