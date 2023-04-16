// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:js';
import 'package:supabase_flutter/supabase_flutter.dart';

Future signInWithEmail(
  String email,
  String password,
) async {
  try {
    final supabase = Supabase.instance.client;
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final Session? session = res.session;
    if (session != null) {
      print('Signed in.');
      return session;
    } else {
      print('Signin failed.');
      return;
    }

    //ユーザー取得は別アクションで実施
    //final User? user = res.user;

  } on AuthException catch (error) {
    print(error.message);
    //var snackBar = SnackBar(content: Text(error.message), );
    //ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } catch (_) {
    print('Unknown Exception');
    //var snackBar = SnackBar(content: Text('Unknown exception'),);
    //ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
