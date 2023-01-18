import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CampusAfricaFirebaseUser {
  CampusAfricaFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CampusAfricaFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CampusAfricaFirebaseUser> campusAfricaFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CampusAfricaFirebaseUser>(
      (user) {
        currentUser = CampusAfricaFirebaseUser(user);
        return currentUser!;
      },
    );
