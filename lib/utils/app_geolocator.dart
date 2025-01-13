import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    required double range,
  }) {
    final distance = _calculateDistance(
      longitude1: longitude1,
      latitude1: latitude1,
      longitude2: longitude2,
      latitude2: latitude2,
    );

    return distance <= range;
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
