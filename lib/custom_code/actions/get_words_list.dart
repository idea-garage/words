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

Future<dynamic> getWordsList() async {
  try {
    // return random row of supabase table "words"
    final supabase = Supabase.instance.client;

    var result = await supabase.from('words').select('*');
//        .neq('desc_en', '')
//        .limit(1)
//        .single();

    var words = result;
    //print(words.toString());
    return words;
  } catch (e) {
    print(e.toString());
    return null;
  }
}
