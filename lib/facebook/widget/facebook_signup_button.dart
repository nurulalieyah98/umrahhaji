import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:umrahhaji/google/provider/google_sign_in.dart';

class FacebookSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlinedButton.icon(
          label: Text(
            'Sign In With Facebook',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          // highlightedBorderColor: Colors.black,
          // borderSide: BorderSide(color: Colors.black),
          // textColor: Colors.black,

          icon: FaIcon(
            FontAwesomeIcons.facebook,
            color: Colors.blue,
          ),
          // onPressed: () {
          //   AuthService().fbSignIn();
          // },
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          },
        ),
      );
}
