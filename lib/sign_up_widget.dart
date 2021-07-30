import 'package:flutter/material.dart';
//import 'package:umrahhaji/google/widget/background_painter.dart';
//import 'package:umrahhaji/google/widget/background_painter.dart';
import 'package:umrahhaji/google/widget/google_signup_button_widget.dart';
import 'package:umrahhaji/otp/widget/phone_signup_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          //CustomPaint(painter: BackgroundPainter()),
          // Image.asset("assets/images/umrahhajilogo.png"),
          //Image.asset("assets/images/kaabah.jpg"),
          buildSignUp(),
        ],
      );

  Widget buildSignUp() => Container(
        color: Colors.green[50],
        child: Column(
          children: [
            Spacer(),
            Image.asset("assets/images/umrahhajilogo.png"),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Image.asset("assets/images/tawaf.png"),
              height: 300,
            ),
            Align(
              alignment: Alignment.centerLeft,
              // child: Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20),
              //   width: 175,
              //   child: Text(
              //     'Welcome To UmrahHaji',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 30,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ),

            Text(
              'Login to Continue',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            PhoneSignupButtonWidget(),
            GoogleSignupButtonWidget(),
            GoogleSignupButtonWidget(),
            // FacebookSignupButtonWidget(),
            SizedBox(height: 12),
            // Text(
            //   'Login to continue',
            //   style: TextStyle(fontSize: 16),
            // ),
            Spacer(),
          ],
        ),
      );
}
