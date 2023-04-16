import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD_RmhYicP6ZR7Gy7jO97MA0mDzwVn8aMg",
            authDomain: "words-fcb33.firebaseapp.com",
            projectId: "words-fcb33",
            storageBucket: "words-fcb33.appspot.com",
            messagingSenderId: "460750557681",
            appId: "1:460750557681:web:ee793894d1a90ba387f450",
            measurementId: "G-EKXSC8NHWV"));
  } else {
    await Firebase.initializeApp();
  }
}
