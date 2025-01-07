import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:eksiazeczka_kgp/designSystem/shimmers/app_shimmer.dart';
import 'package:eksiazeczka_kgp/resources/resources.dart';
import 'package:flutter/material.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    this.url,
    this.localPath,
    this.imageSize = 40,
    super.key,
  });

  final String? url;
  final String? localPath;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageSize / 2),
      child: Container(
        height: imageSize,
        width: imageSize,
        color: Theme.of(context).primaryColor,
        child: _image(context, url: url, localPath: localPath),
      ),
    );
  }

  Widget _image(BuildContext context, {String? url, String? localPath}) {
    if (url != null && url.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, url) {
          return const AppShimmer();
        },
        errorWidget: (context, url, error) {
          return _defaultImage();
        },
      );
    }

    if (localPath != null && localPath.isNotEmpty) {
      return Image.file(
        File(localPath),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    return _defaultImage();
  }

  Widget _defaultImage() {
    return SizedBox.expand(child: Image.asset(AvatarImages.def, fit: BoxFit.cover));
  }
}
