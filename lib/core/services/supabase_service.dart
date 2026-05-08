import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseService._internal();

  static final SupabaseClient _instance = Supabase.instance.client;

  static SupabaseClient get client => _instance;
}
