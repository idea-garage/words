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

Future textToSpeech(String input) async {
  // text input ToSpeech

//  await flutterTts.speak("Hello World");
//  List<dynamic> languages = await flutterTts.getLanguages;
//  print(languages.toString());

  print(input);
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(0.6);
  await flutterTts.setSpeechRate(1);
  await flutterTts.speak(input);
}
