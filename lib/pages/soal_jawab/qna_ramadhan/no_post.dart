import 'package:flutter/material.dart';

//testing
class NoPostQnARamadhan extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Qna Ramadhan'),
          centerTitle: true,
        ),
        body: Text(
          "No Posts Found.",
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontSize: 15.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Roboto',
            color: Colors.black,
          ),
        ),
      );
}
