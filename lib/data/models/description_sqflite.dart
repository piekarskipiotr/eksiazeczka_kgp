part of 'description.dart';

Description _$DescriptionFromSqflite(Map<String, dynamic> json) => Description(
      locale: json['locale'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$DescriptionToSqflite(Description instance) => <String, dynamic>{
      'locale': instance.locale,
      'text': instance.text,
    };
