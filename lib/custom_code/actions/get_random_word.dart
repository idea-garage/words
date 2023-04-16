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

Future<dynamic> getRandomWord() async {
  try {
    // return random row of supabase table "words"
    final supabase = Supabase.instance.client;
    var mood = FFAppState().mood ?? 'Happy';
    if (mood == '') {
      mood = 'Happy';
    }

    var result = await supabase
        .from('words_random')
        .select('*')
        .eq('mood', mood)
        .neq('desc_en', '')
        .limit(1)
        .single();
//        await supabase.from('words_random').select('*').limit(1).single();

    var word = result;
    print(word.toString());
    FFAppState().update(() {
      FFAppState().mood = word['mood'];
    });
    return word;
  } catch (e) {
    print(e.toString());
    return null;
  }
}
