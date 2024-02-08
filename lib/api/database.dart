import 'package:supabase_flutter/supabase_flutter.dart';

late final SupabaseClient db;

class Database {
  static const _supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const _supabaseKey = String.fromEnvironment('SUPABASE_KEY');

  static Future<void> init() async {
    db = (await Supabase.initialize(url: _supabaseUrl, anonKey: _supabaseKey)).client;
  }
}
