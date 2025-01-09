import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/models/peak_coordinates.model.dart';
import 'package:eksiazeczka_kgp/data/models/peak_description.model.dart';
import 'package:eksiazeczka_kgp/data/models/peak_user_metadata.model.dart';
import 'package:eksiazeczka_kgp/utils/utils.dart';
import 'package:uuid/uuid.dart';

@ConnectOfflineFirstWithSupabase(supabaseConfig: SupabaseSerializable(tableName: 'peaks'))
class Peak extends OfflineFirstWithSupabaseModel {
  Peak({
    required this.name,
    required this.coordinates,
    required this.location,
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
  @Supabase(foreignKey: 'peak_id', ignoreTo: true)
  final PeakCoordinates coordinates;
  final String location;
  final String mountainRange;
  final int height;
  final DifficultyLevel difficultyLevel;
  final int averageAscentTime;
  final Popularity popularity;
  @Supabase(foreignKey: 'peak_id', ignoreTo: true)
  final List<PeakDescription> descriptions;
  @Supabase(foreignKey: 'peak_id', ignoreTo: true)
  final PeakUserMetadata? userMetadata;

  @Sqlite(ignore: true)
  @Supabase(ignore: true)
  bool get isConquered => userMetadata != null;

  @Sqlite(ignore: true)
  @Supabase(ignore: true)
  String get image => '/peaks/${name.snakeCase.normalize}/image.jpg';

  @Sqlite(ignore: true)
  @Supabase(ignore: true)
  String get assetImage => 'assets/images/peaks/${name.snakeCase.normalize}.jpg';
}
