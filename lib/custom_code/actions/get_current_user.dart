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
import 'dart:convert';

Future<dynamic> getCurrentUser() async {
  try {
    final supabase = Supabase.instance.client;
    final Session? session = supabase.auth.currentSession;
    if (session == null) {
      print('No session.');
      return null; //No session
    } else {
      print('Got session.');

      final User? user = supabase.auth.currentUser;
      if (user != null) {
        print('Got User.');
        final prof = await supabase
            .from('user_profiles')
            .select('*')
            .eq('id', user!.id)
            .maybeSingle();

        print('Result:' + json.encode(prof));

        if (prof != null) {
          final isAdmin = prof['is_admin'] ?? false;
          FFAppState().update(() {
            FFAppState().currentUser = {'id': user.id, 'email': user.email};
            FFAppState().isAdmin = isAdmin;
          });
        }
        //print('Current user:' + json.encode(user));
      }
      return session;
    }
  } catch (e) {
    print('Exception:getCurrentUser');
    print(e);
  }
}
