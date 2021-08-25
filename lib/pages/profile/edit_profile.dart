import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:umrahhaji/models/users_model.dart';
import 'package:umrahhaji/pages/profile/components/rounded_button.dart';
import 'package:umrahhaji/services/database_service.dart';

class EditProfile extends StatelessWidget {
  EditProfile({this.uid, this.title, this.hintText, this.value});

  final _formKey = GlobalKey<FormState>();

  final String uid;
  final String title;
  final String hintText;
  final String value;
  String _currentName, _currentCellNumber;
  String _email;
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Users>(
        stream: DatabaseService(uid: uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(15.0),
                      child: TextFormField(
                        initialValue: value,
                        validator: (value) =>
                            value.isEmpty ? 'Please enter a name' : null,
                        decoration: InputDecoration(
                          hintText: hintText,
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (title == 'Edit Name') {
                            _currentName = value;
                          } else if (title == 'Edit Phone Number') {
                            _currentCellNumber = value;
                          } else if (title == 'Edit Email') {
                            _email = value;
                          }
                          // else if (title == '')
                        },
                      ),
                    ),
                    RoundedButton(
                      colour: Colors.orange,
                      title: 'Save',
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: uid).updateUserData(
                            _currentName ?? snapshot.data.name,
                            _email ?? snapshot.data.email,
                            _currentCellNumber ?? snapshot.data.cellnumber,
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SpinKitRing(
              color: Colors.orange,
            );
          }
        });
  }
}
