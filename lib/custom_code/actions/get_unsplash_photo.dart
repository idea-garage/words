// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:unsplash_client/unsplash_client.dart';

Future<String> getUnsplashPhoto(
  String accesskey,
  String secretkey,
  String keyword,
) async {
  // search unsplash by keyword and return result image path

  final client = UnsplashClient(
    settings: ClientSettings(
        credentials: AppCredentials(
      accessKey: accesskey,
      secretKey: secretkey,
    )),
  );
  final photos = await client.photos.random(count: 1).goAndGet();
  //    query: keyword,
  //  orientation: UnsplashOrientation.landscape,
  final photo = photos.first;
  final url = photo.urls.regular.toString();

  client.close();

  return url;
}
