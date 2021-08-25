import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umrahhaji/google/page/home_page.dart';
import 'package:umrahhaji/models/users_model.dart';
import 'package:umrahhaji/pages/contact_us/launch.dart';
import 'package:umrahhaji/pages/profile/components/card_contactus.dart';
import 'package:umrahhaji/pages/profile/components/card_profile.dart';
import 'package:umrahhaji/pages/profile/edit_profile.dart';
import 'package:umrahhaji/services/database_service.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class UserProfile extends StatefulWidget {
  UserProfile({this.uid});

  final String uid;

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String _email, _name, _cellnumber;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
      stream: DatabaseService(uid: widget.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Users usersData = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/umrahhaji.jpg'),
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
                            title: 'Name',
                            data: usersData.name,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                    uid: widget.uid,
                                    title: 'Edit Name',
                                    hintText: 'Enter a name',
                                    value: usersData.name,
                                  ),
                                ),
                              );
                            },
                          ),
                          CardProfile(
                            title: 'Email',
                            data: usersData.email,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                    uid: widget.uid,
                                    title: 'Edit Email',
                                    hintText: 'Enter an Email',
                                    value: usersData.email,
                                  ),
                                ),
                              );
                            },
                          ),
                          CardProfile(
                            title: 'Phone Number',
                            data: usersData.cellnumber,
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                    uid: widget.uid,
                                    title: 'Edit Phone Number',
                                    hintText: 'Enter your phone number',
                                    value: usersData.cellnumber,
                                  ),
                                ),
                              );
                              await DatabaseService(uid: widget.uid).userInfo(
                                _name ?? snapshot.data.name,
                                _email ?? snapshot.data.email,
                                _cellnumber ?? snapshot.data.cellnumber,
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
                                  url:
                                      "https://www.facebook.com/umrahhajiofficial/");
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
        } else {
          return SpinKitRing(
            color: Colors.deepPurple,
          );
        }
      },
    );
  }

  signOut() {
    //redirect
    _auth.signOut().then((value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => HomePageGoogle())));
  }
}
