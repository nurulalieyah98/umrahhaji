import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umrahhaji/google/page/home_page.dart';
import 'package:umrahhaji/models/users_model.dart';
import 'package:umrahhaji/pages/profile/testing/testing_home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);

    //Return either the Home or Login Page
    if (user == null) {
      return HomePageGoogle();
    } else {
      return Home(uid: user.uid);
    }
  }
}
