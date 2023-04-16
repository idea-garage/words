// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_tts/flutter_tts.dart';

FlutterTts flutterTts = FlutterTts();

Future textToSpeech(BuildContext context, String input) async {
  // text input ToSpeech
  var lang = await flutterTts.getLanguages;

  if (lang.contains('en-US')) {
    print(input);
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(1);
    await flutterTts.isLanguageAvailable("en-US");
    await flutterTts.speak(input);
  } else {
    var snackBar = SnackBar(
      content: Text('TTS languages do not contain en-US' + lang.toString()),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
