import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:umrahhaji/otp/screen/components/user_profile.dart';
import 'package:umrahhaji/pages/home/home_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController cellnumberController =
      new TextEditingController();
  final TextEditingController otpController = new TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isRegister = true;
  var isOTPScreen = false;
  var verificationCode = '';

  //Form controllers
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    nameController.dispose();
    cellnumberController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isOTPScreen ? returnOTPScreen() : registerScreen();
  }

  Widget registerScreen() {
    final node = FocusScope.of(context);
    return Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: Text(
            'Register new user',
            style: TextStyle(color: Colors.black45),
          ),
          backgroundColor: Colors.green[100],
        ),
        body: ListView(children: [
          new Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 50.0),
                      // SvgPicture.asset(
                      //   "assets/icons/signup.svg",
                      //   height: 0.45,
                      // ),
                      Container(
                          width: 280.0,
                          height: 200.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage(
                                      'assets/images/kaabah.jpg')))),
                      SizedBox(height: 30.0),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: TextFormField(
                          enabled: !isLoading,
                          controller: nameController,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => node.nextFocus(),
                          decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                      )),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: TextFormField(
                          enabled: !isLoading,
                          keyboardType: TextInputType.phone,
                          controller: cellnumberController,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) => node.unfocus(),
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              hintText: 'Eg : 0123456789',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.phone_rounded)),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a phone number';
                            }
                            return null;
                          },
                        ),
                      )),
                      Container(
                          // margin: EdgeInsets.only(top: 40, bottom: 5),
                          margin: EdgeInsets.only(top: 20, bottom: 5),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: new ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreen,
                                ),
                                onPressed: () {
                                  if (!isLoading) {
                                    if (_formKey.currentState.validate()) {
                                      // If the form is valid, we want to show a loading Snackbar
                                      setState(() {
                                        signUp();
                                        isRegister = false;
                                        isOTPScreen = true;
                                      });
                                    }
                                  }
                                },
                                child: new Container(
                                  color: Colors.lightGreen,
                                  width: 100,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 15.0,
                                  ),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Expanded(
                                        child: Text(
                                          "Next",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))),
                    ],
                  ))
            ],
          )
        ]));
  }

  Widget returnOTPScreen() {
    return Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: Text(
            'OTP Screen',
            style: TextStyle(color: Colors.black45),
          ),
          backgroundColor: Colors.green[100],
        ),
        body: ListView(children: [
          Form(
            key: _formKeyOTP,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Text(
                            !isLoading
                                ? "Enter OTP from SMS"
                                : "Sending OTP code SMS",
                            textAlign: TextAlign.center))),
                !isLoading
                    ? Container(
                        child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: TextFormField(
                          enabled: !isLoading,
                          controller: otpController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          initialValue: null,
                          autofocus: true,
                          decoration: InputDecoration(
                              labelText: 'OTP',
                              labelStyle: TextStyle(color: Colors.black)),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter OTP';
                            }
                            return null;
                          },
                        ),
                      ))
                    : Container(),
                !isLoading
                    ? Container(
                        //color: Colors.lightGreen,
                        margin: EdgeInsets.only(top: 40, bottom: 5),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: new ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen,
                              ),
                              onPressed: () async {
                                if (_formKeyOTP.currentState.validate()) {
                                  // If the form is valid, we want to show a loading Snackbar
                                  // If the form is valid, we want to do firebase signup...
                                  setState(() {
                                    isResend = false;
                                    isLoading = true;
                                  });
                                  try {
                                    await _auth
                                        .signInWithCredential(
                                            PhoneAuthProvider.credential(
                                                verificationId:
                                                    verificationCode,
                                                smsCode: otpController.text
                                                    .toString()))
                                        .then((user) async => {
                                              //sign in was success
                                              if (user != null)
                                                {
                                                  //store registration details in firestore database
                                                  await _firestore
                                                      .collection('users')
                                                      .doc(
                                                          _auth.currentUser.uid)
                                                      .set(
                                                          {
                                                        'name': nameController
                                                            .text
                                                            .trim(),
                                                        'cellnumber':
                                                            cellnumberController
                                                                .text
                                                                .trim(),
                                                      },
                                                          SetOptions(
                                                              merge:
                                                                  true)).then(
                                                          (value) => {
                                                                //then move to authorised area
                                                                setState(() {
                                                                  isLoading =
                                                                      false;
                                                                  isResend =
                                                                      false;
                                                                })
                                                              }),

                                                  setState(() {
                                                    isLoading = false;
                                                    isResend = false;
                                                  }),
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            HomePage()),
                                                    (route) => false,
                                                  )
                                                }
                                            })
                                        // ignore: return_of_invalid_type_from_catch_error
                                        .catchError((error) => {
                                              setState(() {
                                                isLoading = false;
                                                isResend = true;
                                              }),
                                            });
                                    setState(() {
                                      isLoading = true;
                                    });
                                  } catch (e) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }
                              },
                              child: new Container(
                                //color: Colors.lightGreen,
                                width: 100,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 15.0,
                                ),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      child: Text(
                                        "Submit",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                )
                              ].where((c) => c != null).toList(),
                            )
                          ]),
                isResend
                    ? Container(
                        margin: EdgeInsets.only(top: 40, bottom: 5),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: new ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isResend = false;
                                  isLoading = true;
                                });
                                await signUp();
                              },
                              child: new Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 15.0,
                                ),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Expanded(
                                      child: Text(
                                        "Resend Code",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )))
                    : Column()
              ],
            ),
          )
        ]));
  }

  Future signUp() async {
    setState(() {
      isLoading = true;
    });
    debugPrint('test 1');
    var phoneNumber = '+60' + cellnumberController.text.trim();
    // var phoneNumber = cellnumberController.text.trim();
    debugPrint('test 2');
    var verifyPhoneNumber = _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {
        debugPrint('test 3');
        //auto code complete (not manually)
        _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
              if (user != null)
                {
                  //store registration details in firestore database
                  await _firestore
                      .collection('users')
                      .doc(_auth.currentUser.uid)
                      .set({
                        'name': nameController.text.trim(),
                        'cellnumber': cellnumberController.text.trim()
                      }, SetOptions(merge: true))
                      .then((value) => {
                            //then move to authorized area
                            setState(() {
                              isLoading = false;
                              isRegister = false;
                              isOTPScreen = false;

                              //navigate to is
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      UserProfile(),
                                ),
                                (route) => false,
                              );
                            })
                          })
                      .catchError((onError) => {
                            debugPrint('Error saving user to database.' +
                                onError.toString())
                          })
                }
            });
        debugPrint('test 4');
      },
      verificationFailed: (FirebaseAuthException error) {
        debugPrint('Error logging in' + error.message);
        setState(() {
          isLoading = false;
        });
      },
      codeSent: (String verificationId, [int forceResendingToken]) async {
        // this.actualCode = verificationId;
        debugPrint('test 6');
        setState(() {
          print('Code sent to $phoneNumber');
          isLoading = false;
          verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint('test 7');
        setState(() {
          isLoading = false;
          verificationCode = verificationId;
        });
      },
      timeout: Duration(seconds: 120),
    );
    debugPrint('test 7');
    await verifyPhoneNumber;
    debugPrint('test 8');
  }
}
