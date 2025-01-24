import 'dart:math';

import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:exif/exif.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class AppGeolocator {
  static Future<bool> checkPermissionStatus({
    required VoidCallback onDenied,
    required VoidCallback onPermanentlyDenied,
  }) async {
    final isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) throw Exception('Location services are disabled.');

    final status = await Geolocator.requestPermission();
    switch (status) {
      case LocationPermission.denied:
        onDenied();
        return false;
      case LocationPermission.deniedForever:
        onPermanentlyDenied();
        return false;
      case _:
        break;
    }

    return true;
  }

  static Future<Position> get currentLocation async {
    const locationSettings = LocationSettings(accuracy: LocationAccuracy.high);
    return Geolocator.getCurrentPosition(locationSettings: locationSettings);
  }

  static bool isWithinRange({
    required double longitude1,
    required double latitude1,
    required double longitude2,
    required double latitude2,
    double range = 200,
  }) {
    final distance = _calculateDistance(
      longitude1: longitude1,
      latitude1: latitude1,
      longitude2: longitude2,
      latitude2: latitude2,
    );

    return distance <= range;
  }

  static Future<Coordinates?> getImageCoordinates(XFile image) async {
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


  static double _calculateDistance({
    required double longitude1,
    required double latitude1,
    required double longitude2,
    required double latitude2,
  }) {
    const double earthRadius = 6371000;
    double toRadians(double degree) => degree * pi / 180;
    final dLat = toRadians(latitude2 - latitude1);
    final dLon = toRadians(longitude2 - longitude1);
    final a = pow(sin(dLat / 2), 2) + cos(toRadians(latitude1)) * cos(toRadians(latitude2)) * pow(sin(dLon / 2), 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }
}
