// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInProvider extends ChangeNotifier {
//   final user = FirebaseAuth.instance.currentUser;
//   final googleSignIn = GoogleSignIn();
//   bool _isSigningIn;

//   String uid;
//   String name;
//   String email;
//   String imageUrl;

//   GoogleSignInProvider() {
//     _isSigningIn = false;
//   }

//   bool get isSigningIn => _isSigningIn;

//   set isSigningIn(bool isSigningIn) {
//     _isSigningIn = isSigningIn;
//     notifyListeners();
//   }

//   Future login() async {
//     isSigningIn = true;

//     final user = await googleSignIn.signIn();
//     // if (user == null) {
//     //   isSigningIn = false;
//     //   return;
//     // } else {
//     final googleAuth = await user.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     await FirebaseAuth.instance.signInWithCredential(credential);

//     userInfo();

//     isSigningIn = false;
//   }

//   Future userInfo() async {
//     final user = await googleSignIn.signIn();
//     final googleAuth = await user.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     await FirebaseAuth.instance.signInWithCredential(credential);

//     if (user == null) {
//       // assert(user.email != null);
//       // assert(user.displayName != null);
//       // assert(user.photoUrl != null);

//       name = user.displayName;
//       email = user.email;
//       imageUrl = user.photoUrl;
//       print(name);
//       print(email);
//       print(imageUrl);

//       final currentUser = FirebaseAuth.instance.currentUser;
//       // print(user.id); //google signin id
//       // print(currentUser.uid);
//       assert(currentUser.uid == currentUser.uid);

//       login().then((value) {
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc(currentUser.uid)
//             .set({
//           'email': email,
//           'name': name,
//           'cellnumber': '',
//         });
//       });
//     }
//     isSigningIn = false;
//   }

//   void logout() async {
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:umrahhaji/pages/profile/testing/testing_home.dart';

// class GoogleSignInProvider extends ChangeNotifier {
//   final user = FirebaseAuth.instance.currentUser;
//   final googleSignIn = GoogleSignIn();
//   final currentUser = FirebaseAuth.instance.currentUser;
//   bool _isSigningIn;

//   String uid;
//   String name;
//   String email;
//   String imageUrl;
//   String cellnumber = "";

//   GoogleSignInProvider() {
//     _isSigningIn = false;
//   }

//   bool get isSigningIn => _isSigningIn;

//   set isSigningIn(bool isSigningIn) {
//     _isSigningIn = isSigningIn;
//     notifyListeners();
//   }

//   Future login() async {
//     isSigningIn = true;

//     final user = await googleSignIn.signIn();
//     final googleAuth = await user.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     await FirebaseAuth.instance.signInWithCredential(credential);

//     userInfo();

//     isSigningIn = false;
//   }

//   Future userInfo() async {
//     final user = await googleSignIn.signIn();
//     final googleAuth = await user.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     await FirebaseAuth.instance.signInWithCredential(credential);

//     if (user == null) {
//       // assert(user.email != null);
//       // assert(user.displayName != null);
//       // assert(user.photoUrl != null);

//       name = user.displayName;
//       email = user.email;
//       imageUrl = user.photoUrl;
//       print(name);
//       print(email);
//       print(imageUrl);

//       // print(user.id); //google signin id
//       // print(currentUser.uid);
//       assert(currentUser.uid == currentUser.uid);

//       login().then((value) {
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc(currentUser.uid)
//             .set({
//           'email': email,
//           'name': name,
//           'cellnumber': '',
//         });
//       });
//     } else {
//       if (user != null) {
//         assert(user.email != null);
//       assert(user.displayName != null);
//       assert(user.photoUrl != null);

//       name = user.displayName;
//       email = user.email;
//       imageUrl = user.photoUrl;
//       print(name);
//       print(email);
//       print(imageUrl);

//       // print(user.id); //google signin id
//       // print(currentUser.uid);
//       assert(currentUser.uid == currentUser.uid);

//       login().then((value) {
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc(currentUser.uid)
//             .set({
//           'email': email,
//           'name': name,
//           'cellnumber': '',
//         });
//       });
//         Home(uid: currentUser.uid);
//       }
//     }
//     isSigningIn = false;
//   }

//   void logout() async {
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// final uid = FirebaseAuth.instance.currentUser;
// String name;
// String email;
// String imageUrl;
// String cellnumber = "";

// Future<String> signInWithGoogle() async {
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final UserCredential authResult =
//       await _auth.signInWithCredential(credential);
//   final User user = authResult.user;

//   assert(user.email != null);
//   assert(user.displayName != null);
//   assert(user.photoURL != null);

//   name = user.displayName;
//   email = user.email;
//   imageUrl = user.photoURL;
//   cellnumber = "";

//   // var users = _auth.currentUser;
//   final User currentUser = _auth.currentUser;

//   assert(user.uid == currentUser.uid);

//   return 'signInWithGoogle Succeeded : $user';
// }

// void logout() async {
//   await googleSignIn.signOut();

//   print("User sign out");
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:umrahhaji/pages/profile/testing/testing_home.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser;
  final googleSignIn = GoogleSignIn();
  final currentUser = FirebaseAuth.instance.currentUser;
  bool _isSigningIn;

  String uid;
  String name;
  String email;
  String imageUrl;
  String cellnumber = "";

  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future login() async {
    isSigningIn = true;

    final user = await googleSignIn.signIn();
    final googleAuth = await user.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    userInfo();

    isSigningIn = false;
  }

  Future userInfo() async {
    final user = await googleSignIn.signIn();
    final googleAuth = await user.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User users = authResult.user;

    if (users == null) {
      // Checking if email and name is null
      assert(user.email == null);
      assert(user.displayName == null);
      assert(user.photoUrl == null);

      name = users.displayName;
      email = users.email;
      imageUrl = users.photoURL;
      print(name);
      print(email);
      print(imageUrl);

      // print(user.id); //google signin id
      // print(currentUser.uid);
      assert(users.uid == currentUser.uid);

      login().then((value) {
        FirebaseFirestore.instance.collection('users').doc(users.uid).update({
          'email': email,
          'name': name,
          'cellnumber': '',
        });
      });
    } else {
      if (user != null) {
        assert(users.email != null);
        assert(users.displayName != null);
        assert(users.photoURL != null);

        name = users.displayName;
        email = users.email;
        imageUrl = users.photoURL;
        print(name);
        print(email);
        print(imageUrl);

        // print(user.id); //google signin id
        // print(currentUser.uid);
        assert(users.uid == currentUser.uid);

        login().then((value) {
          FirebaseFirestore.instance.collection('users').doc(users.uid).set({
            'email': email,
            'name': name,
            'cellnumber': '',
          });
        });
        Home(uid: users.uid);
      }
    }
    isSigningIn = false;
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
