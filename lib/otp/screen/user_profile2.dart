import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umrahhaji/google/page/home_page.dart';
import 'package:umrahhaji/otp/components/card_contactus.dart';
import 'package:umrahhaji/otp/components/card_profile.dart';
import 'package:umrahhaji/pages/contact_us/launch.dart';
import 'package:umrahhaji/pages/home/home_page.dart';

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
                      data: displayName ,
                      // data: getName(),
                      // data: _auth.currentUser.displayName != null
                      //     ? _auth.currentUser.displayName
                      //     : userName,
                    ),
                    CardProfile(
                        title: 'Email : ',
                        data: _auth.currentUser.email != null
                            ? _auth.currentUser.email
                            : ''),
                    CardProfile(
                      title: 'Phone : ',
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
