import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final user = FirebaseAuth.instance.currentUser;
  final googleSignIn = GoogleSignIn();
  bool _isSigningIn;

  String uid;
  String name;
  String email;
  String imageUrl;

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
    // if (user == null) {
    //   isSigningIn = false;
    //   return;
    // } else {
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

    await FirebaseAuth.instance.signInWithCredential(credential);

    if (user != null) {
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoUrl != null);

      name = user.displayName;
      email = user.email;
      imageUrl = user.photoUrl;

      final currentUser = FirebaseAuth.instance.currentUser;
      // print(user.id); //google signin id
      // print(currentUser.uid);
      assert(currentUser.uid == currentUser.uid);

      login().then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .set({
          'email': email,
          'image': imageUrl,
          'name': name,
          'cellnumber': '',
        });
      });
    }
    isSigningIn = false;
  }

  Future updateUserData(
      String email, String name, String cellnumber, imageUrl) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .set({
      uid: currentUser.uid,
      'name': name,
      'email': email,
      'cellnumber': cellnumber
    });
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
