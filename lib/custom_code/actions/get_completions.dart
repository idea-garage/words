// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future getCompletions(
  String title,
  String body,
  String apikey,
) async {
  // post body to openai API, and get response.
  //titleは使っていない

  try {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/engines/davinci/completions'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer ' + apikey, //openai_api_key
      },
      body: jsonEncode(
        {
          'prompt': title + '\n' + body,
          'max_tokens': 100,
          'temperature': 0.7,
          'top_p': 1,
          'n': 1,
          'stream': false,
          'logprobs': null,
          'stop': ['\n'],
        },
      ),
    );

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      final responseBody = utf8.decode(response.bodyBytes);
      FFAppState().update(() {
        FFAppState().response = responseBody;
      });
      print(json.decode(responseBody));
      return json.decode(responseBody);
    } else {
      // If that call was not successful, throw an error.
      print('Failed to load post');
      throw Exception('Failed to load post');
    }
  } catch (e) {
    print(e);
  }
}
