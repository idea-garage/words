// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

Future createPostVector(
  String title,
  String body,
  String apikey,
) async {
  // post body to openai API, and get response.
  final supabase = Supabase.instance.client;
  try {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/embeddings'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer ' + apikey, //openai_api_key
      },
      body: jsonEncode(
        {
          "model": "text-embedding-ada-002",
          "input": body,
        },
      ),
    );

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      //final responseBody = utf8.decode(response.bodyBytes); //文字化けする場合
      final responseBody = jsonDecode(response.body);
      final data = responseBody['data'];
      final embedding = data[0]['embedding'];

      await supabase
          .from('posts')
          .insert({'title': title, 'body': body, 'embedding': embedding});

      //  final response = await supabase.from(tableName).select('*');
/*
      FFAppState().update(() {
        FFAppState().response = responseBody;
      });
      print(json.decode(responseBody));
      return json.decode(responseBody);
*/
      return;
    } else {
      // If that call was not successful, throw an error.
      print('Failed to process');
      throw Exception('Failed to process');
    }
  } catch (e) {
    print(e);
  }
}
