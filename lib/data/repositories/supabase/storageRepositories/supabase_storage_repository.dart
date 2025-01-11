import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageRepository {
  final instance = Supabase.instance.client.storage;
}
