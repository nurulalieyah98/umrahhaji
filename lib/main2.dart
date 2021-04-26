// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// // Import the firebase_core plugin
// import 'package:firebase_core/firebase_core.dart';
// import 'package:umrahhaji/screen/login_screen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(App());
// }

// class App extends StatelessWidget {
//   // Create the initialization Future outside of `build`:
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Phone Verification',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           primaryColor: Colors.greenAccent,
//           primarySwatch: Colors.orange,
//           inputDecorationTheme:
//               InputDecorationTheme(labelStyle: TextStyle(color: Colors.grey)),
//           backgroundColor: Colors.white),
//       home: FutureBuilder(
//         // Initialize FlutterFire:
//         future: _initialization,
//         builder: (context, snapshot) {
//           // Check for errors
//           if (snapshot.hasError) {
//             return Container(
//               color: Colors.white,
//               child: SpinKitRing(
//                 color: Colors.red,
//               ),
//             );
//           }

//           // Once complete, show your application
//           if (snapshot.connectionState == ConnectionState.done) {
//             return LoginScreen();
//           }

//           // Otherwise, show something whilst waiting for initialization to complete
//           return Container(
//             color: Colors.white,
//             child: SpinKitRing(
//               color: Colors.deepPurple,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// // Import the firebase_core plugin
// import 'package:firebase_core/firebase_core.dart';
// import 'package:umrahhaji/screen/login_screen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(App());
// }

// class App extends StatelessWidget {
//   // Create the initialization Future outside of `build`:
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Phone Verification',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           primaryColor: Colors.greenAccent,
//           primarySwatch: Colors.orange,
//           inputDecorationTheme:
//               InputDecorationTheme(labelStyle: TextStyle(color: Colors.grey)),
//           backgroundColor: Colors.white),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Trying'),
//         ),
//         body: Center(
//           child: FutureBuilder(
//             // Initialize FlutterFire:
//             future: Firebase.initializeApp(),
//             builder: (context, snapshot) {
//               // Check for errors
//               if (snapshot.hasError) {
//                 return Container(
//                   color: Colors.white,
//                   child: SpinKitRing(
//                     color: Colors.red,
//                   ),
//                 );
//               }

//               // Once complete, show your application
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return LoginScreen();
//               }

//               // Otherwise, show something whilst waiting for initialization to complete
//               return Container(
//                 color: Colors.white,
//                 child: SpinKitRing(
//                   color: Colors.deepPurple,
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:umrahhaji/screen/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        primarySwatch: Colors.orange,
        inputDecorationTheme:
            InputDecorationTheme(labelStyle: TextStyle(color: Colors.grey)),
        backgroundColor: Colors.white,
      ),
      home: FirstRoute(title: 'First Route'),
    );
  }
}

class FirstRoute extends StatefulWidget {
  FirstRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return LoginScreen();
              // return Column(
              //   children: [
              //     Container(
              //       height: 27,
              //       child: Text(
              //         "Name: ${snapshot.data.data()['name']}",
              //         overflow: TextOverflow.fade,
              //         style: TextStyle(fontSize: 20),
              //       ),
              //     ),
              //   ],
              // );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Text("No data");
            }
            return CircularProgressIndicator();
          },
        ));
  }

  Future<DocumentSnapshot> getData() async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance
        .collection("users")
        .doc("uid")
        .get();
  }
}
