// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:umrahhaji/otp/screen/login_screen.dart';
// import 'package:umrahhaji/pages/home/home_page.dart';

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
//             : HomePage();
//   }
// }

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:umrahhaji/pages/home/home_page.dart';

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
//         home: HomePage());
//   }
// }

// //main
// import 'package:flutter/material.dart';
// //import 'package:umrahhaji/page/home_page_facebook.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:umrahhaji/google/page/home_page.dart';
// //import 'package:umrahhaji/widget/sign_up_widget.dart';
// //import 'package:umrahhaji/page/home_page_facebook.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   static final String title = 'UmrahHaji Login';

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: title,
//         theme: ThemeData(
//           primaryColor: Colors.green[100],
//           primarySwatch: Colors.lightGreen,
//         ),
//         home: HomePageGoogle(),
//       );
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:umrahhaji/models/users_model.dart';
import 'package:umrahhaji/services/auth.dart';
import 'package:umrahhaji/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'UmrahHaji Login';

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green[100],
          primarySwatch: Colors.lightGreen,
        ),
        home: Wrapper(),
      ),
    );
  }
}
