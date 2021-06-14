// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:umrahhaji/otp/screen/login_screen.dart';
// import 'package:umrahhaji/otp/screen/user_profile.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await FlutterDownloader.initialize(
//       debug: true // optional: set false to disable printing logs to console
//       );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Umrah Haji',
//         theme: ThemeData(
//           primaryColor: Colors.teal,
//           primarySwatch: Colors.orange,
//           inputDecorationTheme:
//               InputDecorationTheme(labelStyle: TextStyle(color: Colors.grey)),
//           backgroundColor: Colors.white,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         debugShowCheckedModeBanner: false,
//         home: InitializerWidget());
//   }
// }

// class InitializerWidget extends StatefulWidget {
//   @override
//   _InitializerWidgetState createState() => _InitializerWidgetState();
// }

// class _InitializerWidgetState extends State<InitializerWidget> {
//   FirebaseAuth _auth;

//   User _user;

//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _auth = FirebaseAuth.instance;
//     _user = _auth.currentUser;
//     isLoading = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : _user == null
//             ? LoginScreen()
//             : UserProfile();
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:umrahhaji/pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Umrah Haji',
        theme: ThemeData(
          primaryColor: Colors.teal,
          primarySwatch: Colors.orange,
          inputDecorationTheme:
              InputDecorationTheme(labelStyle: TextStyle(color: Colors.grey)),
          backgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
