import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/modul%20ebook/body_ebook.dart';

class ScreenEbook extends StatelessWidget {
  const ScreenEbook({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text("Percuma"),
      ),
      body: BodyEbook(),
    );
  }
}
