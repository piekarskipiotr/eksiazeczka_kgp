import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';

@ConnectOfflineFirstWithSupabase(supabaseConfig: SupabaseSerializable(tableName: 'peaks_description'))
class PeakDescription extends OfflineFirstWithSupabaseModel {
  PeakDescription({
    required this.locale,
    required this.text,
    required this.peakId,
    String? id,
  }) : id = id ?? const Uuid().v4();

  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  final String locale;
  final String text;
  final String peakId;

  @override
  String toString() {
    return 'PeakDescription{id: $id, locale: $locale, text: $text, peakId: $peakId}';
  }
}
