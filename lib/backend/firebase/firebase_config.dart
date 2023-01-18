import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBx4kPnRuoIkof4JYLSdcrokDkp7AJUN_0",
            authDomain: "campus-africa-bda4b.firebaseapp.com",
            projectId: "campus-africa-bda4b",
            storageBucket: "campus-africa-bda4b.appspot.com",
            messagingSenderId: "73650904699",
            appId: "1:73650904699:web:37916ded453a7fd3ff4cde",
            measurementId: "G-PEZETS2RJ4"));
  } else {
    await Firebase.initializeApp();
  }
}
