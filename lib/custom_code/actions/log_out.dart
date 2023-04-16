// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future logOut() async {
  await supabase.auth.signOut();
  FFAppState().update(() {
    FFAppState().currentUser = '';
    FFAppState().isAdmin = false;
  });
  print('Logged out.');
}
