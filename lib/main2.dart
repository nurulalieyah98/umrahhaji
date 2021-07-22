// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:umrahhaji/login_screen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(App());
// }

// class App extends StatelessWidget {
//   // Create the initialization Future outside of `build`:
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return Center(
//             child: Text('Could not load app'),
//           );
//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MaterialApp(
//             title: 'Phone Verification',
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//                 primaryColor: Colors.greenAccent,
//                 primarySwatch: Colors.orange,
//                 inputDecorationTheme: InputDecorationTheme(
//                     labelStyle: TextStyle(color: Colors.grey)),
//                 backgroundColor: Colors.white),
//             home: LoginScreen(),
//           );
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         return Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             textBaseline: TextBaseline.alphabetic,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.baseline,
//                 textBaseline: TextBaseline.alphabetic,
//                 textDirection: TextDirection.ltr,
//                 children: <Widget>[
//                   CircularProgressIndicator(
//                     backgroundColor: Theme.of(context).primaryColor,
//                   )
//                 ],
//               )
//             ]);
//       },
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/scheduler.dart';
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
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return Center(
//             child: Text('Could not load app'),
//           );
//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MaterialApp(
//             title: 'Phone Verification',
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//                 primaryColor: Colors.greenAccent,
//                 primarySwatch: Colors.orange,
//                 inputDecorationTheme: InputDecorationTheme(
//                     labelStyle: TextStyle(color: Colors.grey)),
//                 backgroundColor: Colors.white),
//             home: LoginScreen(),
//           );
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         return Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             textBaseline: TextBaseline.alphabetic,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 textBaseline: TextBaseline.alphabetic,
//                 children: <Widget>[
//                   CircularProgressIndicator(
//                     backgroundColor: Theme.of(context).primaryColor,
//                   )
//                 ],
//               )
//             ]);
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/rendering.dart';
// import 'package:umrahhaji/screen/login_screen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(App());
// }

// class App extends StatefulWidget {
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> {
//   // Set default `_initialized` and `_error` state to false
//   bool _initialized = false;
//   bool _error = false;

//   // Define an async function to initialize FlutterFire
//   void initializeFlutterFire() async {
//     try {
//       // Wait for Firebase to initialize and set `_initialized` state to true
//       await Firebase.initializeApp();
//       setState(() {
//         _initialized = true;
//       });
//     } catch (e) {
//       // Set `_error` state to true if Firebase initialization fails
//       setState(() {
//         _error = true;
//       });
//     }
//   }

//   @override
//   void initState() {
//     initializeFlutterFire();
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       MaterialApp();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Show error message if initialization failed
//     if (_error) {
//       return Center(
//         child: Text('Could not load app'),
//       );
//     }

//     // Show a loader until FlutterFire is initialized
//     if (!_initialized) {
//       return Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           textBaseline: TextBaseline.alphabetic,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               textBaseline: TextBaseline.alphabetic,
//               children: <Widget>[
//                 CircularProgressIndicator(
//                   backgroundColor: Theme.of(context).primaryColor,
//                 )
//               ],
//             )
//           ]);
//     }

//     return Column(children: <Widget>[
//       Expanded(
//           child: Theme(
//         data: ThemeData.from(
//           colorScheme: ColorScheme.fromSwatch(
//             primarySwatch: Colors.orange,
//             primaryColorDark: Colors.greenAccent,
//             backgroundColor: Colors.white,
//           ),
//         ),
//         child: null,
//         // child: new MediaQuery(
//         //     data: new MediaQueryData(),
//         //     child: new MaterialApp(home: new LoginScreen()))))
//       ))
//     ]);
//   }
// }

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
//   // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

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

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:umrahhaji/screen/login_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   // final Widget child;
//   const MyApp({Key key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Future<FirebaseApp> _initialization;

//   @override
//   void initState() {
//     _initialization = Firebase.initializeApp();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           // return SomethingWentWrong();
//           print('Something went wrong in Flutter Fire');
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           return LoginScreen();
//         }

//         return Container();
//       },
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:umrahhaji/screen/login_screen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.greenAccent,
//         primarySwatch: Colors.orange,
//         inputDecorationTheme:
//             InputDecorationTheme(labelStyle: TextStyle(color: Colors.grey)),
//         backgroundColor: Colors.white,
//       ),
//       home: FirstRoute(title: 'First Route'),
//     );
//   }
// }

// class FirstRoute extends StatefulWidget {
//   FirstRoute({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _FirstRouteState createState() => _FirstRouteState();
// }

// class _FirstRouteState extends State<FirstRoute> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("test"),
//         ),
//         body: FutureBuilder(
//           future: getData(),
//           builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return LoginScreen();
//               // return Column(
//               //   children: [
//               //     Container(
//               //       height: 27,
//               //       child: Text(
//               //         "Name: ${snapshot.data.data()['name']}",
//               //         overflow: TextOverflow.fade,
//               //         style: TextStyle(fontSize: 20),
//               //       ),
//               //     ),
//               //   ],
//               // );
//             } else if (snapshot.connectionState == ConnectionState.none) {
//               return Text("No data");
//             }
//             return CircularProgressIndicator();
//           },
//         ));
//   }

//   Future<DocumentSnapshot> getData() async {
//     await Firebase.initializeApp();
//     return await FirebaseFirestore.instance
//         .collection("users")
//         .doc("uid")
//         .get();
//   }
// }

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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:umrahhaji/screen/login_screen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.greenAccent,
//         primarySwatch: Colors.orange,
//         inputDecorationTheme:
//             InputDecorationTheme(labelStyle: TextStyle(color: Colors.grey)),
//         backgroundColor: Colors.white,
//       ),
//       home: FirstRoute(title: 'First Route'),
//     );
//   }
// }

// class FirstRoute extends StatefulWidget {
//   FirstRoute({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _FirstRouteState createState() => _FirstRouteState();
// }

// class _FirstRouteState extends State<FirstRoute> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("test"),
//         ),
//         body: FutureBuilder(
//           future: getData(),
//           builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return LoginScreen();
//               // return Column(
//               //   children: [
//               //     Container(
//               //       height: 27,
//               //       child: Text(
//               //         "Name: ${snapshot.data.data()['name']}",
//               //         overflow: TextOverflow.fade,
//               //         style: TextStyle(fontSize: 20),
//               //       ),
//               //     ),
//               //   ],
//               // );
//             } else if (snapshot.connectionState == ConnectionState.none) {
//               return Text("No data");
//             }
//             return CircularProgressIndicator();
//           },
//         ));
//   }

//   Future<DocumentSnapshot> getData() async {
//     await Firebase.initializeApp();
//     return await FirebaseFirestore.instance
//         .collection("users")
//         .doc("uid")
//         .get();
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:umrahhaji/otp/screen/components/login_screen.dart';
import 'package:umrahhaji/otp/screen/components/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Umrah Haji',
        theme: ThemeData(
          primaryColor: Colors.greenAccent,
          primarySwatch: Colors.orange,
          inputDecorationTheme:
              InputDecorationTheme(labelStyle: TextStyle(color: Colors.grey)),
          backgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: InitializerWidget());
  }
}

class InitializerWidget extends StatefulWidget {
  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth _auth;

  User _user;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? LoginScreen()
            : UserProfile();
  }
}
