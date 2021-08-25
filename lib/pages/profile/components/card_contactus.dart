import 'package:flutter/material.dart';

class CardContactUs extends StatelessWidget {
  CardContactUs({this.title, this.onPressed, this.icon});

  final String title;
  final Icon icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(1.0),
      child: ListTile(
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon,
            // Text(data),
            IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
