import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/modul%20ebook/body_ebook.dart';

class ScreenEbook extends StatelessWidget {
  const ScreenEbook({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Percuma"),
        centerTitle: true,
      ),
      body: BodyEbook(),
    );
  }
}
