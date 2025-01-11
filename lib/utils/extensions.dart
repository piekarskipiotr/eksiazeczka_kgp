import 'package:intl/intl.dart';

extension StringExtensions on String {
  String get normalize {
    const polishAccents = {
      'ó': 'o',
      'ą': 'a',
      'ę': 'e',
      'ś': 's',
      'ł': 'l',
      'ż': 'z',
      'ź': 'z',
      'ć': 'c',
      'ń': 'n',
    };

    return split('').map((char) {
      return polishAccents[char] ?? char;
    }).join();
  }

  String get snakeCase {
    final lowerCase = toLowerCase();
    return lowerCase.replaceAll(' ', '_').toLowerCase();
  }

  String get capitalizeFirst {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get formatToDDMMYYYYDate {
    try {
      final parsedDate = DateTime.parse(this);
      return DateFormat('dd.MM.yyyy').format(parsedDate);
    } catch (e) {
      return '';
    }
  }
}
