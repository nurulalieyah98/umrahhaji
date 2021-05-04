import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umrahhaji/otp/components/card_profile.dart';
import 'package:umrahhaji/otp/screen/login_Screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var userName = '';
final _scaffoldKey = GlobalKey<ScaffoldState>();

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('User Profile'),
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
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
                      data: userName,
                    ),
                    CardProfile(
                        title: 'Phone Number : ',
                        data: (_auth.currentUser.phoneNumber != null
                            ? _auth.currentUser.phoneNumber
                            : '')),
                    // Text(
                    //   'Welcome ' + userName,
                    //   style: TextStyle(fontSize: 30),
                    // ),
                    // Text('(Phone Number: ' +
                    //     (_auth.currentUser.phoneNumber != null
                    //         ? _auth.currentUser.phoneNumber
                    //         : '') +
                    //     ' uid:' +
                    //     (_auth.currentUser.uid != null ? _auth.currentUser.uid : '') +
                    //     ')'),
                    ElevatedButton(
                        onPressed: () => {
                              //sign out
                              signOut()
                            },
                        child: Text('Sign out'))
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
            userName = result.docs[0].data()['name'];
          });
        }
      });
    }
  }

  signOut() {
    //redirect
    _auth.signOut().then((value) => Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen())));
  }
}
