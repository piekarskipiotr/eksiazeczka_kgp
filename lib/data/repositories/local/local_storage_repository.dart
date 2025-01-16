import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class LocalStorageRepository {
  Future<String> saveUserPeakImage(Uint8List fileBytes, String peakId) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = path.join(directory.path, 'userPeakPhotos', peakId, 'image.jpg');
      final file = File(filePath);
      await file.parent.create(recursive: true);
      await file.writeAsBytes(fileBytes);
      return filePath;
    } catch (e) {
      throw Exception('Error uploading photo: $e');
    }
  }

  Future<String> getUserPeakImagePath(String peakId) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = path.join(directory.path, 'userPeakPhotos/$peakId/image.jpg');
      final file = File(filePath);

      if (file.existsSync()) {
        return filePath;
      } else {
        throw Exception('File not found for peakId: $peakId');
      }
    } catch (e) {
      throw Exception('Error fetching photo path: $e');
    }
  }
}
