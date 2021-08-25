import 'package:firebase_auth/firebase_auth.dart';
import 'package:umrahhaji/models/users_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  Users _userFromFirebase(User user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Users> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
      //print("Successfully Logout");
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //reset password
  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
