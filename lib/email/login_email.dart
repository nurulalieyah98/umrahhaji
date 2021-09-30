// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:umrahhaji/email/component/rounded_button.dart';
// import 'package:umrahhaji/email/register_email.dart';
// import 'package:umrahhaji/models/users_model.dart';
// import 'package:umrahhaji/services/auth.dart';

// class LoginEmail extends StatefulWidget {
//   @override
//   _LoginEmailState createState() => _LoginEmailState();
// }

// class _LoginEmailState extends State<LoginEmail> {
//   final _formKey = GlobalKey<FormState>();
//   final AuthService _auth = AuthService();

//   String email = '', password = '', error = '', errorCode, errorMessage;

//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<Users>.value(
//         initialData: null,
//         value: AuthService().user,
//         child: Scaffold(
//           backgroundColor: Colors.green[50],
//           body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Center(
//               child: Form(
//                 key: _formKey,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Image.asset('assets/images/UH1.png'),
//                       Text(
//                         'Login With Email',
//                         style: TextStyle(
//                           fontSize: 15.0,
//                           height: 3.0,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           //backgroundColor: Colors.yellowAccent[100],
//                         ),
//                       ),
//                       // DecoratedBox(
//                       //   decoration: BoxDecoration(
//                       //     image: DecorationImage(
//                       //       image: AssetImage('assets/uitmmelaka.png'),
//                       //     ),
//                       //   ),
//                       // ),
//                       TextFormField(
//                         textAlign: TextAlign.center,
//                         validator: (val) =>
//                             val.isEmpty ? 'Please enter an email' : null,
//                         onChanged: (value) {
//                           email = value;
//                         },
//                         decoration: InputDecoration(
//                           hintText: 'Enter email',
//                         ),
//                       ),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                       TextFormField(
//                         obscureText: true,
//                         textAlign: TextAlign.center,
//                         validator: (val) => val.length < 6
//                             ? 'Enter a password 6+ chars long'
//                             : null,
//                         onChanged: (value) {
//                           password = value;
//                         },
//                         decoration: InputDecoration(
//                           hintText: 'Enter password',
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'First Time?',
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             TextSpan(
//                                 text: ' Click Here',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.red,
//                                 ),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 RegisterEmail()));
//                                   }),
//                           ],
//                         ),
//                       ),
//                       RoundedButton(
//                         colour: Colors.orange,
//                         title: 'Log In',
//                         onPressed: () async {
//                           if (_formKey.currentState.validate()) {
//                             dynamic result =
//                                 await _auth.signInWithEmailAndPassword(
//                                     email.trim(), password);
//                             setState(() {
//                               if (result == null) {
//                                 error = 'Wrong Email or Password';
//                               }
//                             });
//                           }
//                         },
//                       ),
//                       SizedBox(height: 12.0),
//                       Text(
//                         error,
//                         style: TextStyle(color: Colors.red, fontSize: 14.0),
//                       ),

//                       // RichText(
//                       //   text: TextSpan(
//                       //     children: [
//                       //       TextSpan(
//                       //           text: 'Forgot Password?',
//                       //           style: TextStyle(
//                       //             fontWeight: FontWeight.bold,
//                       //             // decoration: TextDecoration.underline,
//                       //             color: Colors.blueGrey[800],
//                       //           ),
//                       //           recognizer: TapGestureRecognizer()
//                       //             ..onTap = () {
//                       //               Navigator.push(
//                       //                   context,
//                       //                   MaterialPageRoute(
//                       //                       builder: (context) =>
//                       //                           ForgotPassword()));
//                       //             }),
//                       //     ],
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umrahhaji/email/component/constants.dart';
import 'package:umrahhaji/email/component/rounded_button.dart';
import 'package:umrahhaji/email/register_email.dart';
import 'package:umrahhaji/models/users_model.dart';
import 'package:umrahhaji/services/auth.dart';

class LoginEmail extends StatefulWidget {
  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String email = '', password = '', error = '', errorCode, errorMessage;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
        initialData: null,
        value: AuthService().user,
        child: Scaffold(
          backgroundColor: Colors.green[50],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/UH1.png'),
                      Text(
                        'Login With Email',
                        style: TextStyle(
                          fontSize: 15.0,
                          height: 3.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          //backgroundColor: Colors.yellowAccent[100],
                        ),
                      ),
                      // DecoratedBox(
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       image: AssetImage('assets/uitmmelaka.png'),
                      //     ),
                      //   ),
                      // ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        validator: (val) =>
                            val.isEmpty ? 'Please enter an email' : null,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter email',
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter password',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'First Time?',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                                text: ' Click Here',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterEmail()));
                                  }),
                          ],
                        ),
                      ),
                      RoundedButton(
                        colour: Colors.orange,
                        title: 'Log In',
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result =
                                await _auth.signInWithEmailAndPassword(
                                    email.trim(), password);
                            setState(() {
                              if (result == null) {
                                error = 'Wrong Email or Password';
                              }
                            });
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),

                      // RichText(
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //           text: 'Forgot Password?',
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.bold,
                      //             // decoration: TextDecoration.underline,
                      //             color: Colors.blueGrey[800],
                      //           ),
                      //           recognizer: TapGestureRecognizer()
                      //             ..onTap = () {
                      //               Navigator.push(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                       builder: (context) =>
                      //                           ForgotPassword()));
                      //             }),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
