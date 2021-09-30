import 'package:flutter/material.dart';
import 'package:umrahhaji/email/component/constants.dart';
import 'package:umrahhaji/email/component/rounded_button.dart';
import 'package:umrahhaji/services/auth.dart';
import 'package:umrahhaji/wrapper.dart';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '',
      password = '',
      error = '',
      samePassword = '',
      name = '',
      cellnumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/UH1.png'),
                      Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18.0,
                          height: 2.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        validator: (val) =>
                            val.isEmpty ? 'Enter an name' : null,
                        onChanged: (value) {
                          name = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your name',
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        validator: (val) =>
                            val.length < 6 ? 'Enter an email' : null,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your email',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        validator: (val) =>
                            val.length < 10 ? 'Enter 10-11 digit number' : null,
                        onChanged: (value) {
                          cellnumber = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your phone number',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your password',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (value) {
                          samePassword = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Re-enter the password',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RoundedButton(
                        colour: Colors.orange,
                        title: 'Register',
                        onPressed: () async {
                          if (_formKey.currentState.validate() &&
                              samePassword == password) {
                            dynamic result = await _auth.registerUserInfo(
                                email.trim(), password, name, cellnumber);
                            if (result == null) {
                              setState(() {
                                error = 'Please supply valid email';
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Wrapper(),
                                ),
                              );
                            }
                          } else {
                            setState(() {
                              // error = 'Password is not match';
                              error = 'Password is not match';
                            });
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
