import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/models/peak_description.model.dart';
import 'package:eksiazeczka_kgp/data/models/peak_user_metadata.model.dart';
import 'package:uuid/uuid.dart';

@ConnectOfflineFirstWithSupabase(supabaseConfig: SupabaseSerializable(tableName: 'peaks'))
class Peak extends OfflineFirstWithSupabaseModel {
  Peak({
    required this.name,
    required this.coordinatesLat,
    required this.coordinatesLng,
    required this.mountainRange,
    required this.height,
    required this.difficultyLevel,
    required this.averageAscentTime,
    required this.popularity,
    required this.descriptions,
    this.userMetadata,
    String? id,
  }) : id = id ?? const Uuid().v5(Namespace.url.value, name);

  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  final String name;
  final double coordinatesLat;
  final double coordinatesLng;
  final String mountainRange;
  final int height;
  final DifficultyLevel difficultyLevel;
  final int averageAscentTime;
  final Popularity popularity;
  @Supabase(foreignKey: 'peak_id', ignoreTo: true)
  final List<PeakDescription> descriptions;
  @Supabase(foreignKey: 'peak_id', ignoreTo: true)
  final PeakUserMetadata? userMetadata;
}
