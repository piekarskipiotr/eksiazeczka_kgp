import 'package:uuid/uuid.dart';

part 'peak_user_metadata_sqflite.dart';

class PeakUserMetadata {
  PeakUserMetadata({
    required this.peakId,
    this.userId,
    String? id,
    DateTime? conqueredDate,
  })  : id = id ?? const Uuid().v4(),
        conqueredDate = conqueredDate ?? DateTime.now();

  factory PeakUserMetadata.fromSqflite(Map<String, dynamic> json) => _$PeakUserMetadataFromSqflite(json);

  Map<String, dynamic> toSqflite() => _$PeakUserMetadataToSqflite(this);


  final String id;
  final DateTime conqueredDate;
  final String peakId;
  final String? userId;
}
