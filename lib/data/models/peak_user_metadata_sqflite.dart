part of 'peak_user_metadata.dart';

PeakUserMetadata _$PeakUserMetadataFromSqflite(Map<String, dynamic> json) => PeakUserMetadata(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      peakId: json['peak_id'] as String,
      conqueredDate: DateTime.parse(json['conquered_date'] as String),
    );

Map<String, dynamic> _$PeakUserMetadataToSqflite(PeakUserMetadata instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'peak_id': instance.peakId,
      'conquered_date': instance.conqueredDate.toIso8601String(),
    };
