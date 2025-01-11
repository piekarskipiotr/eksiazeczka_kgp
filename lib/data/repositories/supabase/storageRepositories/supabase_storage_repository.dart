import 'dart:typed_data';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageRepository {
  final instance = Supabase.instance.client.storage;

  static const _avatarsStorageBucketPath = 'avatars';

  String _buildAvatarPath({required String userId}) => '$userId/avatar.png';

  Future<void> uploadAvatar({required Uint8List fileBytes, required String userId}) async {
    try {
      final supabasePath = _buildAvatarPath(userId: userId);
      await instance.from(_avatarsStorageBucketPath).uploadBinary(
            supabasePath,
            fileBytes,
            fileOptions: const FileOptions(upsert: true),
          );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getUserAvatar({required String userId}) async {
    try {
      final supabasePath = _buildAvatarPath(userId: userId);
      final publicUrl = await instance.from(_avatarsStorageBucketPath).createSignedUrl(supabasePath, 2592000);
      return '$publicUrl?version=${DateTime.now().millisecondsSinceEpoch}';
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
