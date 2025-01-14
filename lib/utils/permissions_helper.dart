import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHelper {
  static Future<bool> checkPermissionStatus({
    required Permission permission,
    VoidCallback? onDenied,
    VoidCallback? onPermanentlyDenied,
  }) async {
    final status = await permission.request();
    switch (status) {
      case PermissionStatus.denied:
        onDenied?.call();
        return false;
      case PermissionStatus.permanentlyDenied:
        onPermanentlyDenied?.call();
        return false;
      case _:
        break;
    }

    return true;
  }
}
