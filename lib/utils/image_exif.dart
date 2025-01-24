import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:exif/exif.dart';
import 'package:image_picker/image_picker.dart';

class ImageExif {
  static Future<DateTime?> getImageDateTime(XFile image) async {
    try {
      final bytes = await image.readAsBytes();
      final data = await readExifFromBytes(bytes);
      if (data.isEmpty) return null;

      final ifdTag = data['DateTimeOriginal'] ?? data['DateTime'];
      if (ifdTag == null) return null;

      final dateString = ifdTag.toString();
      return DateTime.parse(dateString.replaceFirst(':', '-', 2));
    } catch (e) {
      throw Exception('Failed to getImageDateTime: $e');
    }
  }

  static Future<Coordinates?> getImageCoordinates(XFile image) async {
    try {
      final bytes = await image.readAsBytes();
      final data = await readExifFromBytes(bytes);
      if (data.isEmpty) return null;

      final gpsLat = data['GPSLatitude'];
      final gpsLatRef = data['GPSLatitudeRef'];
      final gpsLon = data['GPSLongitude'];
      final gpsLonRef = data['GPSLongitudeRef'];
      if (gpsLat == null || gpsLatRef == null || gpsLon == null || gpsLonRef == null) return null;

      final latitude = _convertToDecimalDegrees(gpsLat.values, gpsLatRef.toString());
      final longitude = _convertToDecimalDegrees(gpsLon.values, gpsLonRef.toString());
      if (latitude == null || longitude == null) return null;

      return Coordinates(latitude: latitude, longitude: longitude);
    } catch (e) {
      throw Exception('Failed to getImageCoordinates: $e');
    }
  }

  static double? _convertToDecimalDegrees(dynamic value, dynamic ref) {
    if (value is! List || value.length != 3) return null;

    final degrees = _toDouble(value[0]);
    final minutes = _toDouble(value[1]);
    final seconds = _toDouble(value[2]);
    if (degrees == null || minutes == null || seconds == null) return null;

    var decimal = degrees + (minutes / 60) + (seconds / 3600);
    if (ref == 'S' || ref == 'W') decimal = -decimal;

    return decimal;
  }

  static double? _toDouble(dynamic value) {
    if (value is num) {
      return value.toDouble();
    } else if (value is String) {
      return double.tryParse(value);
    } else if (value is List && value.length == 2) {
      final numerator = _toDouble(value[0]);
      final denominator = _toDouble(value[1]);
      if (numerator != null && denominator != null && denominator != 0) {
        return numerator / denominator;
      }
    }
    return null;
  }
}
