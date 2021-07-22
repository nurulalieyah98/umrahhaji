import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umrahhaji/otp/components/card_contactus.dart';
import 'package:umrahhaji/otp/components/card_profile.dart';
import 'package:umrahhaji/pages/contact_us/launch.dart';
import 'package:umrahhaji/pages/home/home_page.dart';
import 'package:umrahhaji/otp/screen/login_otp.dart';

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
                      data: userName,
                      //data: _auth.currentUser.displayName != null
                      // ? _auth.currentUser.displayName
                      // : ''
                    ),
                    CardProfile(
                        title: 'Email : ',
                        data: _auth.currentUser.email != null
                            ? _auth.currentUser.email
                            : ''),
                    CardProfile(
                      title: 'Phone Number : ',
                      data: (_auth.currentUser.phoneNumber != null
                          ? _auth.currentUser.phoneNumber
                          : ''),
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
