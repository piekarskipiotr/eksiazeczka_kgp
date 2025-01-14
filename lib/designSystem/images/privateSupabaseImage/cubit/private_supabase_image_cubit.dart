import 'dart:async';

import 'package:eksiazeczka_kgp/data/constants.dart';
import 'package:eksiazeczka_kgp/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'private_supabase_image_state.dart';

class PrivateSupabaseImageCubit extends Cubit<PrivateSupabaseImageState> {
  PrivateSupabaseImageCubit(this._authService) : super(const PrivateSupabaseImageState());

  final AuthService _authService;

  Future<void> initialize(String path) async {
    final user = await _authService.getCurrentUser();
    final imageUrl = '$supabaseUrl/storage/v1/object/authenticated/userPeakPhotos/${user.id}/$path';
    final headers = {
      'method': 'GET',
      'apikey': supabaseKey,
      'Authorization': 'Bearer ${user.id}',
    };
  }
}
