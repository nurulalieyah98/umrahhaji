// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:umrahhaji/facebook/error_handler.dart';
// import 'package:umrahhaji/sign_up_widget.dart';
// //import 'package:umrahhaji/facebook/page/home_page_facebook.dart';
// import 'package:umrahhaji/user_profile.dart';

// class AuthService {
//   //Determine if the user is authenticated.
//   handleAuth() {
//     return StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.hasData) {
//             return UserProfile();
//           } else
//             return SignUpWidget();
//         });
//   }

//   //Sign In
//   signIn(String email, String password, context) {
//     FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password)
//         .then((val) {
//       print('signed in');
//     }).catchError((e) {
//       ErrorHandler().errorDialog(context, e);
//     });
//   }

//   //fb signin

//   fbSignIn() async {
//     final fb = FacebookLogin();

// // Log in
//     final res = await fb.logIn(permissions: [
//       FacebookPermission.publicProfile,
//       FacebookPermission.email,
//     ]);

// // Check result status
//     switch (res.status) {
//       case FacebookLoginStatus.success:
//         // Logged in

//         // Send access token to server for validation and auth
//         final FacebookAccessToken accessToken = res.accessToken;
//         final AuthCredential authCredential = FacebookAuthProvider.credential(accessToken.token);
//         final result = await FirebaseAuth.instance.signInWithCredential(authCredential);

//         // Get profile data
//         final profile = await fb.getUserProfile();
//         print('Hello, ${profile.name}! You ID: ${profile.userId}');

//         // Get user profile image url
//         final imageUrl = await fb.getProfileImageUrl(width: 100);
//         print('Your profile image: $imageUrl');

//         // Get email (since we request email permission)
//         final email = await fb.getUserEmail();
//         // But user can decline permission
//         if (email != null) print('And your email is $email');

//         break;
//       case FacebookLoginStatus.cancel:
//         // User cancel log in
//         break;
//       case FacebookLoginStatus.error:
//         // Log in failed
//         print('Error while log in: ${res.error}');
//         break;
//     }
//   }

//   //Signup a new user
//   signUp(String email, String password) {
//     return FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: email, password: password);
//   }

//   //Reset Password
//   resetPasswordLink(String email) {
//     FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//   }

//   //Sign out
//   // signOut() {
//   //   FirebaseAuth.instance.signOut();
//   // }

//   Future signOut() async {
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     await _auth.signOut();
//     //await fbSignIn().logOut();
//     //_user = null;
//   }
// }