import 'package:cached_network_image/cached_network_image.dart';
import 'package:eksiazeczka_kgp/designSystem/shimmers/shimmers.dart';
import 'package:flutter/material.dart';

class PrivateSupabaseImageView extends StatelessWidget {
  const PrivateSupabaseImageView({
    required this.width,
    required this.height,
    required this.radius,
    super.key,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: _image(context, url: 'url'),
      ),
    );
  }

  Widget _image(BuildContext context, {required String url}) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      placeholder: (_, __) {
        return const AppShimmer();
      },
      errorWidget: (_, __, ___) {
        return const AppShimmer();
      },
    );
  }
}
