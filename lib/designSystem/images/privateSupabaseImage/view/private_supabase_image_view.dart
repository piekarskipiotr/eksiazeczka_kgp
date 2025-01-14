import 'package:cached_network_image/cached_network_image.dart';
import 'package:eksiazeczka_kgp/designSystem/images/privateSupabaseImage/cubit/private_supabase_image_cubit.dart';
import 'package:eksiazeczka_kgp/designSystem/shimmers/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final url = context.watch<PrivateSupabaseImageCubit>().state.url;
    final headers = context.watch<PrivateSupabaseImageCubit>().state.headers;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        height: height,
        width: width,
        child: _image(context, url: url, headers: headers),
      ),
    );
  }

  Widget _image(BuildContext context, {required String? url, required Map<String, String>? headers}) {
    if (url == null) return const AppShimmer();
    return CachedNetworkImage(
      imageUrl: url,
      httpHeaders: headers,
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
