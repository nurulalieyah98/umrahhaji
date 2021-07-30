import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umrahhaji/otp/screen/login_screen.dart';

class PhoneSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlinedButton.icon(
          label: Text(
            'Sign In With Phone',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 8),
          ),
          // highlightedBorderColor: Colors.black,
          // borderSide: BorderSide(color: Colors.black),
          // textColor: Colors.black,

          icon: FaIcon(FontAwesomeIcons.phone, color: Colors.grey),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      );
}
