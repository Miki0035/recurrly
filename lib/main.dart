import 'package:flutter/material.dart';
import 'package:recurrly/app.dart';
import 'package:recurrly/core/constants/env/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseAnonKey);

  runApp(const MainApp());
}
