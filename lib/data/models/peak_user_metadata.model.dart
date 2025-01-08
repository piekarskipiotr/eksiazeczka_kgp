import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';

@ConnectOfflineFirstWithSupabase(supabaseConfig: SupabaseSerializable(tableName: 'peaks_user_metadata'))
class PeakUserMetadata extends OfflineFirstWithSupabaseModel {
  PeakUserMetadata({
    required this.peakId,
    required this.userId,
    String? id,
    DateTime? conqueredDate,
  })  : id = id ?? const Uuid().v4(),
        conqueredDate = conqueredDate ?? DateTime.now();

  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  final DateTime conqueredDate;
  final String peakId;
  final String userId;

  @override
  String toString() {
    return 'PeakUserMetadata{id: $id, conqueredDate: $conqueredDate, peakId: $peakId, userId: $userId}';
  }
}
