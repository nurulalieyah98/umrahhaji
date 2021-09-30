import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umrahhaji/email/login_email.dart';

class EmailSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlinedButton.icon(
          label: Text(
            'Sign In With Email',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 8),
          ),
          icon: FaIcon(FontAwesomeIcons.envelope, color: Colors.grey),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginEmail()));
          },
        ),
      );
}
