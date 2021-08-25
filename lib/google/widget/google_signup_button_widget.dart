import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umrahhaji/google/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlinedButton.icon(
          label: Text(
            'Sign In With Google',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 8),
          ),
          icon: FaIcon(
            FontAwesomeIcons.google,
            color: Colors.red,
          ),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();

            // final user = FirebaseAuth.instance.currentUser;

            // if (user != null) {}
          },
        ),
      );
}
