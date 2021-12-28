import 'package:firebase_auth/firebase_auth.dart';

import 'package:my_voice_app/models/user.dart';

class MVAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static MVUser? _convertMVUser(User? user) {
    return user != null
        ? MVUser(uid: user.uid, displayName: user.displayName)
        : null;
  }

  static Stream<MVUser?> get userStream {
    return _auth.authStateChanges().map(_convertMVUser);
  }

  static Future<MVUser?> registerNEP(
      String name, String email, String password) async {
    try {
      UserCredential res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = res.user;
      user?.updateDisplayName(name);
      return _convertMVUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
