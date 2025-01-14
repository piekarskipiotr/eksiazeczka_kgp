import 'package:cached_network_image/cached_network_image.dart';
import 'package:eksiazeczka_kgp/data/constants.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/l10n/l10n.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/widgets/peak_details_information_section.dart';
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
    return PeakDetailsInformationSection(
      label: l10n.memorablePhoto,
      description: l10n.memorablePhotoDescription,
      extraContent: [
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
    );
  }
}
