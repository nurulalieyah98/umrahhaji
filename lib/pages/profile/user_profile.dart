// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:umrahhaji/pages/profile/components/card_contactus.dart';
// import 'package:umrahhaji/pages/profile/components/card_profile.dart';
// import 'package:umrahhaji/pages/contact_us/launch.dart';
// import 'package:umrahhaji/pages/home/home_page.dart';
// import 'package:umrahhaji/otp/screen/login_screen.dart';
// import 'package:umrahhaji/pages/profile/edit_profile.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// var userName = '';
// final _scaffoldKey = GlobalKey<ScaffoldState>();

// class UserProfile extends StatefulWidget {
//   UserProfile({Key key}) : super(key: key);

//   @override
//   _UserProfileState createState() => _UserProfileState();
// }

// class _UserProfileState extends State<UserProfile> {
//   final currentUser = FirebaseAuth.instance.currentUser;
//   String _email, _name, _cellNumber;

//   // @override
//   // void initState() {
//   //   getUser();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('User Profile'),
//         leading: BackButton(
//             color: Colors.white,
//             onPressed: () => Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => HomePage()))),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 30.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundImage: AssetImage('assets/images/umrahhaji.jpg'),
//                   radius: 70.0,
//                 ),
//                 SizedBox(
//                   height: 40.0,
//                 ),
//                 Divider(
//                   thickness: 15.0,
//                   color: Colors.grey,
//                 ),
//                 Column(
//                   children: <Widget>[
//                     CardProfile(
//                       title: 'Name : ',
//                       data: _auth.currentUser.displayName != null
//                           ? _auth.currentUser.displayName
//                           : '',
//                       // data: displayName,
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EditProfile(
//                               uid: currentUser.uid,
//                               title: 'Edit Name',
//                               hintText: 'Enter your name',
//                               value: userName,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     CardProfile(
//                       title: 'Email : ',
//                       data: _auth.currentUser.email != null
//                           ? _auth.currentUser.email
//                           : '',
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EditProfile(
//                               uid: currentUser.uid,
//                               title: 'Edit Email',
//                               hintText: 'Enter your email',
//                               value: _auth.currentUser.email != null
//                                   ? _auth.currentUser.email
//                                   : '',
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     CardProfile(
//                       title: 'Phone : ',
//                       data: (_auth.currentUser.phoneNumber != null
//                           ? _auth.currentUser.phoneNumber
//                           : ''),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EditProfile(
//                               uid: currentUser.uid,
//                               title: 'Edit Phone Number',
//                               hintText: 'Enter your phone number',
//                               value: (_auth.currentUser.phoneNumber != null
//                                   ? _auth.currentUser.phoneNumber
//                                   : ''),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     Divider(
//                       thickness: 15.0,
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Center(
//                       child: Text(
//                         "Contact Us",
//                         style: new TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16.0,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Divider(
//                       thickness: 15.0,
//                       color: Colors.grey,
//                     ),
//                     CardContactUs(
//                       title: 'Whatsapp',
//                       icon: Icon(
//                         FontAwesomeIcons.whatsapp,
//                         color: Colors.green,
//                       ),
//                       onPressed: () {
//                         LaunchUrl.launchWhatsapp(
//                             phone: "+601126138399",
//                             message: "Testing whatsapp contact us");
//                       },
//                     ),
//                     CardContactUs(
//                       title: 'Gmail',
//                       icon: Icon(
//                         FontAwesomeIcons.mailBulk,
//                         color: Colors.orange,
//                       ),
//                       onPressed: () {
//                         LaunchUrl.openEmail(
//                             toEmail: "umrahhaji.com@gmail.com",
//                             subject: "Hubungi Kami",
//                             body: "Enquiry:");
//                       },
//                     ),
//                     CardContactUs(
//                       title: 'Facebook',
//                       icon: Icon(
//                         FontAwesomeIcons.facebook,
//                         color: Colors.blue,
//                       ),
//                       onPressed: () {
//                         LaunchUrl.launchUniversalLinkIos(
//                             url: "https://www.facebook.com/umrahhajiofficial/");
//                       },
//                     ),
//                     Divider(
//                       thickness: 15.0,
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     ElevatedButton(
//                       onPressed: () => {
//                         //sign out
//                         signOut()
//                       },
//                       child: Text('Sign out'),
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Future getUser() async {
//   //   if (_auth.currentUser != null) {
//   //     var cellNumber = _auth.currentUser.phoneNumber;
//   //     cellNumber =
//   //         '0' + _auth.currentUser.phoneNumber.substring(3, cellNumber.length);
//   //     debugPrint(cellNumber);
//   //     await _firestore
//   //         .collection('users')
//   //         .where('cellnumber', isEqualTo: cellNumber)
//   //         .get()
//   //         .then((result) {
//   //       if (result.docs.length > 0) {
//   //         setState(() {
//   //           userName = result.docs[0].data()['name'];
//   //           cellNumber = result.docs[0].data()['cellnumber'];
//   //         });
//   //       }
//   //     });
//   //   }
//   // }

//   signOut() {
//     //redirect
//     _auth.signOut().then((value) => Navigator.pushReplacement(context,
//         MaterialPageRoute(builder: (BuildContext context) => LoginScreen())));
//   }
// }

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter_spinkit/flutter_spinkit.dart';
// // import 'package:flutter/material.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:umrahhaji/models/users_model.dart';
// // import 'package:umrahhaji/otp/screen/login_screen.dart';
// // import 'package:umrahhaji/pages/contact_us/launch.dart';
// // import 'package:umrahhaji/pages/profile/components/card_contactus.dart';
// // import 'package:umrahhaji/pages/profile/components/card_profile.dart';
// // import 'package:umrahhaji/pages/profile/edit_profile.dart';
// // import 'package:umrahhaji/services/database_service.dart';

// // class UserProfile extends StatefulWidget {
// //   UserProfile({this.uid});

// //   final String uid;

// //   @override
// //   _UserProfileState createState() => _UserProfileState();
// // }

// // class _UserProfileState extends State<UserProfile> {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //   final currentUser = FirebaseAuth.instance.currentUser;
// //   String _email, _name, _cellNumber;

// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<Users>(
// //       stream: DatabaseService(uid: widget.uid).userData,
// //       builder: (context, snapshot) {
// //         if (snapshot.hasData) {
// //           Users usersData = snapshot.data;
// //           return Scaffold(
// //             appBar: AppBar(
// //               title: Text('User Profile'),
// //             ),
// //             body: SingleChildScrollView(
// //               child: Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(top: 30.0),
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: <Widget>[
// //                       CircleAvatar(
// //                         backgroundImage:
// //                             AssetImage('assets/images/umrahhaji.jpg'),
// //                         radius: 70.0,
// //                       ),
// //                       SizedBox(
// //                         height: 40.0,
// //                       ),
// //                       Divider(
// //                         thickness: 15.0,
// //                         color: Colors.grey,
// //                       ),
// //                       Column(
// //                         children: <Widget>[
// //                           CardProfile(
// //                             title: 'Name : ',
// //                             data: usersData.name,
// //                             // data: displayName,
// //                             onPressed: () {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) => EditProfile(
// //                                     uid: currentUser.uid,
// //                                     title: 'Edit Name',
// //                                     hintText: 'Enter your name',
// //                                     value: usersData.name,
// //                                   ),
// //                                 ),
// //                               );
// //                             },
// //                           ),
// //                           CardProfile(
// //                             title: 'Email : ',
// //                             data: usersData.email,
// //                             onPressed: () {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) => EditProfile(
// //                                     uid: currentUser.uid,
// //                                     title: 'Edit Email',
// //                                     hintText: 'Enter your email',
// //                                     value: usersData.email,
// //                                   ),
// //                                 ),
// //                               );
// //                             },
// //                           ),
// //                           CardProfile(
// //                             title: 'Phone : ',
// //                             data: usersData.cellnumber,
// //                             onPressed: () async {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) => EditProfile(
// //                                     uid: currentUser.uid,
// //                                     title: 'Edit Phone Number',
// //                                     hintText: 'Enter your phone number',
// //                                     value: usersData.cellnumber,
// //                                   ),
// //                                 ),
// //                               );
// //                               await DatabaseService(uid: widget.uid).userInfo(
// //                                 _email ?? snapshot.data.email,
// //                                 _name ?? snapshot.data.name,
// //                                 _cellNumber ?? snapshot.data.cellnumber,
// //                               );
// //                             },
// //                           ),
// //                           Divider(
// //                             thickness: 15.0,
// //                             color: Colors.grey,
// //                           ),
// //                           SizedBox(
// //                             height: 20.0,
// //                           ),
// //                           Center(
// //                             child: Text(
// //                               "Contact Us",
// //                               style: new TextStyle(
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 16.0,
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(
// //                             height: 20.0,
// //                           ),
// //                           Divider(
// //                             thickness: 15.0,
// //                             color: Colors.grey,
// //                           ),
// //                           CardContactUs(
// //                             title: 'Whatsapp',
// //                             icon: Icon(
// //                               FontAwesomeIcons.whatsapp,
// //                               color: Colors.green,
// //                             ),
// //                             onPressed: () {
// //                               LaunchUrl.launchWhatsapp(
// //                                   phone: "+601126138399",
// //                                   message: "Testing whatsapp contact us");
// //                             },
// //                           ),
// //                           CardContactUs(
// //                             title: 'Gmail',
// //                             icon: Icon(
// //                               FontAwesomeIcons.mailBulk,
// //                               color: Colors.orange,
// //                             ),
// //                             onPressed: () {
// //                               LaunchUrl.openEmail(
// //                                   toEmail: "umrahhaji.com@gmail.com",
// //                                   subject: "Hubungi Kami",
// //                                   body: "Enquiry:");
// //                             },
// //                           ),
// //                           CardContactUs(
// //                             title: 'Facebook',
// //                             icon: Icon(
// //                               FontAwesomeIcons.facebook,
// //                               color: Colors.blue,
// //                             ),
// //                             onPressed: () {
// //                               LaunchUrl.launchUniversalLinkIos(
// //                                   url:
// //                                       "https://www.facebook.com/umrahhajiofficial/");
// //                             },
// //                           ),
// //                           Divider(
// //                             thickness: 15.0,
// //                             color: Colors.grey,
// //                           ),
// //                           SizedBox(
// //                             height: 20.0,
// //                           ),
// //                           ElevatedButton(
// //                             onPressed: () => {
// //                               //sign out
// //                               signOut()
// //                             },
// //                             child: Text('Sign out'),
// //                           ),
// //                           SizedBox(
// //                             height: 20.0,
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           );
// //         } else {
// //           return SpinKitRing(color: Colors.orange);
// //         }
// //       },
// //     );
// //   }

// //   signOut() {
// //     //redirect
// //     _auth.signOut().then((value) => Navigator.pushReplacement(context,
// //         MaterialPageRoute(builder: (BuildContext context) => LoginScreen())));
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umrahhaji/google/page/home_page.dart';
import 'package:umrahhaji/pages/profile/components/card_contactus.dart';
import 'package:umrahhaji/pages/profile/components/card_profile.dart';
import 'package:umrahhaji/pages/contact_us/launch.dart';
import 'package:umrahhaji/pages/home/home_page.dart';
import 'package:umrahhaji/pages/profile/edit_profile.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var userName = '';
var displayName = '';
final _scaffoldKey = GlobalKey<ScaffoldState>();

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    getUser();
    // getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Profile'),
        leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()))),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/umrahhaji.jpg'),
                  radius: 70.0,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Divider(
                  thickness: 15.0,
                  color: Colors.grey,
                ),
                Column(
                  children: <Widget>[
                    CardProfile(
                      title: 'Name : ',
                      // data: userName,
                      data: displayName,
                      // data: getName(),
                      // data: _auth.currentUser.displayName != null
                      //     ? _auth.currentUser.displayName
                      //     : userName,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              uid: currentUser.uid,
                              title: 'Edit Name',
                              hintText: 'Enter your name',
                              value: userName,
                            ),
                          ),
                        );
                      },
                    ),
                    CardProfile(
                      title: 'Email : ',
                      data: _auth.currentUser.email != null
                          ? _auth.currentUser.email
                          : '',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              uid: currentUser.uid,
                              title: 'Edit Email',
                              hintText: 'Enter your email',
                              value: _auth.currentUser.email != null
                                  ? _auth.currentUser.email
                                  : '',
                            ),
                          ),
                        );
                      },
                    ),
                    CardProfile(
                      title: 'Phone : ',
                      data: (_auth.currentUser.phoneNumber != null
                          ? _auth.currentUser.phoneNumber
                          : ''),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              uid: currentUser.uid,
                              title: 'Edit Phone Number',
                              hintText: 'Enter your phone number',
                              value: (_auth.currentUser.phoneNumber != null
                                  ? _auth.currentUser.phoneNumber
                                  : ''),
                            ),
                          ),
                        );
                      },
                    ),
                    Divider(
                      thickness: 15.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Text(
                        "Contact Us",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Divider(
                      thickness: 15.0,
                      color: Colors.grey,
                    ),
                    CardContactUs(
                      title: 'Whatsapp',
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        LaunchUrl.launchWhatsapp(
                            phone: "+601126138399",
                            message: "Testing whatsapp contact us");
                      },
                    ),
                    CardContactUs(
                      title: 'Gmail',
                      icon: Icon(
                        FontAwesomeIcons.mailBulk,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        LaunchUrl.openEmail(
                            toEmail: "umrahhaji.com@gmail.com",
                            subject: "Hubungi Kami",
                            body: "Enquiry:");
                      },
                    ),
                    CardContactUs(
                      title: 'Facebook',
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        LaunchUrl.launchUniversalLinkIos(
                            url: "https://www.facebook.com/umrahhajiofficial/");
                      },
                    ),
                    CardContactUs(
                      title: 'Telegram',
                      icon: Icon(
                        FontAwesomeIcons.telegram,
                        color: Colors.lightBlueAccent,
                      ),
                      onPressed: () {
                        LaunchUrl.launchUniversalLinkIos(
                            url: "https://t.me/NotaUmrahHaji");
                      },
                    ),
                    CardContactUs(
                      title: 'Twitter',
                      icon: Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () {
                        LaunchUrl.launchUniversalLinkIos(
                            url: "https://twitter.com/ComUmrahhaji");
                      },
                    ),
                    CardContactUs(
                      title: 'Jemaah Umrah Haji Malaysia',
                      icon: Icon(
                        FontAwesomeIcons.kaaba,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        LaunchUrl.launchUniversalLinkIos(
                            url:
                                "https://www.facebook.com/groups/2785127388276138/?ref=share");
                      },
                    ),
                    Divider(
                      thickness: 15.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        //sign out
                        signOut()
                      },
                      child: Text('Sign out'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getUser() async {
    if (_auth.currentUser != null) {
      displayName = _auth.currentUser.displayName;
      var cellNumber = _auth.currentUser.phoneNumber;
      cellNumber =
          '0' + _auth.currentUser.phoneNumber.substring(3, cellNumber.length);
      debugPrint(cellNumber);
      await _firestore
          .collection('users')
          .where('cellnumber', isEqualTo: cellNumber)
          .get()
          .then((result) {
        if (result.docs.length > 0) {
          setState(() {
            displayName = result.docs[0].data()['name'];
          });
        }
      });
    }
  }

  signOut() {
    //redirect
    _auth.signOut().then((value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => HomePageGoogle())));
  }

  Future getName() async {
    if (_auth.currentUser.displayName != null) {
      displayName = _auth.currentUser.displayName;
      return (displayName);
    } else {
      var cellNumber = _auth.currentUser.phoneNumber;
      cellNumber =
          '0' + _auth.currentUser.phoneNumber.substring(3, cellNumber.length);
      debugPrint(cellNumber);
      await _firestore
          .collection('users')
          .where('cellnumber', isEqualTo: cellNumber)
          .get()
          .then((result) {
        if (result.docs.length > 0) {
          setState(() {
            displayName = result.docs[0].data()['name'];
          });
        }
        return (displayName);
      });
    }
  }
}
