import 'package:eksiazeczka_kgp/designSystem/images/privateSupabaseImage/cubit/private_supabase_image_cubit.dart';
import 'package:eksiazeczka_kgp/designSystem/images/privateSupabaseImage/view/private_supabase_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivateSupabaseImage extends StatelessWidget {
  const PrivateSupabaseImage({
    required this.path,
    required this.width,
    required this.height,
    required this.radius,
    super.key,
  });

  final String path;
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrivateSupabaseImageCubit(context.read())..initialize(path),
      child: PrivateSupabaseImageView(
        width: width,
        height: height,
        radius: radius,
      ),
    );
  }
}
