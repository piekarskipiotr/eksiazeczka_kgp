import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

class AppLogger {
  static const String _infoEmoji = 'ℹ️';
  static const String _errorEmoji = '❌';
  static const String _debugEmoji = '🐛';
  static const String _warningEmoji = '⚠️';

  static void info(String message) {
    if (_isLoggingEnabled) {
      _printLog(_infoEmoji, 'INFO', message);
    }
  }

  static void error(String message, [StackTrace? stackTrace]) {
    if (_isLoggingEnabled) {
      _printLog(_errorEmoji, 'ERROR', message);
      if (stackTrace != null) {
        developer.log('$stackTrace', level: 1000);
      }
    }
  }

  static void debug(String message) {
    if (_isLoggingEnabled) {
      _printLog(_debugEmoji, 'DEBUG', message);
    }
  }

  static void warning(String message) {
    if (_isLoggingEnabled) {
      _printLog(_warningEmoji, 'WARNING', message);
    }
  }

  static void _printLog(String emoji, String type, String message) {
    final formattedMessage = '$emoji [$type]: $message';
    developer.log(formattedMessage, name: 'Logger');
  }

  static bool get _isLoggingEnabled => kDebugMode;
}
