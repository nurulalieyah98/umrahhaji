import 'package:flutter/material.dart';

//testing
class NoPostQnARamadhan extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: new AppBar(
        //   title: new Text("Qna Ramadhan"),
        //   automaticallyImplyLeading: false, //to remove back button
        // ),
        body: Center(
          child: Text(
            "No Posts Found.",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 15.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
        ),
      );
}
