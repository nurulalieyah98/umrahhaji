import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:umrahhaji/google/provider/google_sign_in.dart';
import 'package:umrahhaji/google/widget/sign_up_widget.dart';
import 'package:provider/provider.dart';
import 'package:umrahhaji/models/users_model.dart';
import 'package:umrahhaji/pages/profile/testing/testing_home.dart';
import 'package:umrahhaji/wrapper.dart';

class HomePageGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);
              final Users user = Users();

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return Wrapper();
              } else {
                return SignUpWidget();
              }
            },
          ),
        ),
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          //CustomPaint(painter: BackgroundPainter()),
          Center(child: CircularProgressIndicator()),
        ],
      );
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:umrahhaji/google/provider/google_sign_in.dart';
// import 'package:umrahhaji/sign_up_widget.dart';
// import 'package:provider/provider.dart';
// import 'package:umrahhaji/wrapper.dart';

// class HomePageGoogle extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: ChangeNotifierProvider(
//           create: (context) => GoogleSignInProvider(),
//           child: StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               final provider = Provider.of<GoogleSignInProvider>(context);

//               if (provider.isSigningIn) {
//                 return buildLoading();
//               } else if (snapshot.hasData) {
//                 return Wrapper();
//               } else {
//                 return SignUpWidget();
//               }
//             },
//           ),
//         ),
//       );

//   Widget buildLoading() => Stack(
//         fit: StackFit.expand,
//         children: [
//           //CustomPaint(painter: BackgroundPainter()),
//           Center(child: CircularProgressIndicator()),
//         ],
//       );
// }
