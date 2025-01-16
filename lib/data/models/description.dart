part 'description_sqflite.dart';

class Description {
  const Description({
    required this.locale,
    required this.text,
  });

  factory Description.fromSqflite(Map<String, dynamic> json) => _$DescriptionFromSqflite(json);

  Map<String, dynamic> toSqflite() => _$DescriptionToSqflite(this);

  final String locale;
  final String text;
}
