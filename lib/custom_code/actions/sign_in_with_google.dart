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

Future signInWithGoogle() async {
  final supabase = Supabase.instance.client;
  const bool kIsWeb = bool.fromEnvironment('dart.library.js_util');

  print('Sign in...');
  print(supabase.toString());

  Future signInWithGoogle() async {
    await supabase.auth.signInWithOAuth(
      Provider.google,
      redirectTo: kIsWeb
          //  ? 'https://skillme.fun/loginCallback'
          ? 'https://words.flutterflow.app/logincallback'
          : 'words://words.com/logincallback',

      //redirectTo: redirectTo,
      //redirectTo: 'io.supabase.flutter://reset-callback/',
      //redirectTo: 'https://skillme.flutterflow.app/',
    );
  }
}
