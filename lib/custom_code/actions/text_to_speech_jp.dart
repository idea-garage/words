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

Future textToSpeechJp(String input) async {
  // text input ToSpeech

  print(input);
  await flutterTts.setLanguage("ja-JP");
  await flutterTts.setPitch(0.9);
  await flutterTts.setSpeechRate(0.8);
  await flutterTts.isLanguageAvailable("ja-JP");
  await flutterTts.speak(input);
}
