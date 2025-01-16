import 'package:cached_network_image/cached_network_image.dart';
import 'package:eksiazeczka_kgp/designSystem/design_system.dart';
import 'package:flutter/material.dart';

class NetworkAssetImage extends StatelessWidget {
  const NetworkAssetImage({
    required this.assetPath,
    required this.height,
    required this.radius,
    this.disable = false,
    this.url,
    super.key,
  });

  final String? url;
  final String assetPath;
  final double height;
  final double radius;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            disable ? AppColors.black : AppColors.transparent,
            BlendMode.saturation,
          ),
          child: _image(context, assetPath: assetPath, url: url),
        ),
      ),
    );
  }

  Widget _image(BuildContext context, {required String assetPath, String? url}) {
    if (url == null || url.isNotEmpty) return _localImage(path: assetPath);

    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      placeholder: (context, url) {
        return const AppShimmer();
      },
      errorWidget: (context, url, error) {
        return _localImage(path: assetPath);
      },
    );
  }

  Widget _localImage({required String path}) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (_, __, ___) {
        return const AppShimmer();
      },
    );
  }
}
