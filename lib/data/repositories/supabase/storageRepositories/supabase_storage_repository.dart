import 'dart:typed_data';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageRepository {
  final instance = Supabase.instance.client.storage;
  static const _usersPeakPhotosStorageId = 'userPeakPhotos';

  String _buildPeakPhoto(String peakId, String userId) => '$userId/$peakId/image.jpg';

  Future<void> uploadPeakPhoto(Uint8List fileBytes, String peakId, String userId) async {
    try {
      final supabasePath = _buildPeakPhoto(peakId, userId);
      await instance.from(_usersPeakPhotosStorageId).uploadBinary(
            supabasePath,
            fileBytes,
            fileOptions: const FileOptions(upsert: true),
          );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
