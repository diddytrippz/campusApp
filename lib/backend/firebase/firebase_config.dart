import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCMJdWk3jhTbk4mNCv6lxH0CkaaEoVp9H4",
            authDomain: "campus-africa-5p16dz.firebaseapp.com",
            projectId: "campus-africa-5p16dz",
            storageBucket: "campus-africa-5p16dz.firebasestorage.app",
            messagingSenderId: "38114027904",
            appId: "1:38114027904:web:e4e044aed9d573e2557965"));
  } else {
    await Firebase.initializeApp();
  }
}
