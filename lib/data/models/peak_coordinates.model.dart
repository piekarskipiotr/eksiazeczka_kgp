import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_supabase/brick_supabase.dart';

@ConnectOfflineFirstWithSupabase(supabaseConfig: SupabaseSerializable(tableName: 'peak_coordinates'))
class PeakCoordinates extends OfflineFirstWithSupabaseModel {
  PeakCoordinates({
    required this.coordinatesLat,
    required this.coordinatesLng,
    required this.peakId,
  });

  final double coordinatesLat;
  final double coordinatesLng;
  final String peakId;
}
