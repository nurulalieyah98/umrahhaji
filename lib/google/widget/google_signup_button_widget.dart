// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:umrahhaji/google/provider/google_sign_in.dart';
// import 'package:umrahhaji/wrapper.dart';

// class GoogleSignupButtonWidget extends StatelessWidget {
//   final _auth = FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) => Container(
//         padding: EdgeInsets.all(4),
//         child: OutlinedButton.icon(
//             label: Text(
//               'Sign In With Google',
//               style: TextStyle(fontSize: 18, color: Colors.black),
//             ),
//             style: OutlinedButton.styleFrom(
//               shape: StadiumBorder(),
//               padding: EdgeInsets.symmetric(horizontal: 23, vertical: 8),
//             ),
//             icon: FaIcon(
//               FontAwesomeIcons.google,
//               color: Colors.red,
//             ),
//             onPressed: () async {
//               // final provider =
//               //     Provider.of<GoogleSignInProvider>(context, listen: false);
//               // provider.login();
//               final user = await googleSignIn.signIn();

//               if (user == null) {
//                 signInWithGoogle().then((onValue) {
//                   FirebaseFirestore.instance
//                       .collection('users')
//                       .doc(_auth.uid)
//                       .set({
//                     'email': email,
//                     'name': name,
//                     'cellnumber': cellnumber,
//                   });
//                 }).catchError((e) {
//                   print(e);
//                 }).then((onValue) {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Wrapper()));
//                 }).catchError((e) {
//                   print(e);
//                 });
//               }
//               else
//               {
//                 if(user!=null)
//                 {
//                   signInWithGoogle().then((onValue) {
//                   FirebaseFirestore.instance
//                       .collection('users')
//                       .doc(_auth.uid)
//                       .({
//                     'email': email,
//                     'name': name,
//                     'cellnumber': cellnumber,
//                   });
//                 }).catchError((e) {
//                   print(e);
//                 }).then((onValue) {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Wrapper()));
//                 }).catchError((e) {
//                   print(e);
//                 });
//                 }
//               }
//             }),
//       );
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umrahhaji/google/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlinedButton.icon(
          label: Text(
            'Sign In With Google',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 8),
          ),
          icon: FaIcon(
            FontAwesomeIcons.google,
            color: Colors.red,
          ),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();

            // final user = FirebaseAuth.instance.currentUser;

            // if (user != null) {}
          },
        ),
      );
}
