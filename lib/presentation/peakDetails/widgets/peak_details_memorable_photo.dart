import 'package:cached_network_image/cached_network_image.dart';
import 'package:eksiazeczka_kgp/data/constants.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PeakDetailsMemorablePhoto extends StatelessWidget {
  const PeakDetailsMemorablePhoto({
    required this.peakId,
    required this.userId,
    required this.userToken,
    super.key,
  });

  final String peakId;
  final String userId;
  final String userToken;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.memorablePhoto, style: AppTextStyles.h4()),
          Text(l10n.memorablePhotoDescription, style: AppTextStyles.h7()),
          CachedNetworkImage(
            imageUrl: '$supabaseUrl/storage/v1/object/authenticated/userPeakPhotos/$userId/$peakId/image.jpg',
            fit: BoxFit.cover,
            width: 400,
            height: 400,
            httpHeaders: {
              'method': 'GET',
              'apikey': supabaseKey,
              'Authorization': 'Bearer $userToken',
            },
            placeholder: (context, url) {
              return const AppShimmer();
            },
          ),
        ],
      ),
    );
  }
}
