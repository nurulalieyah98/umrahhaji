import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsQnAUmrah extends StatefulWidget {
  final String imageUrl, title, desc;
  DetailsQnAUmrah({this.imageUrl, this.title, this.desc});
  @override
  _DetailsQnAUmrahState createState() => _DetailsQnAUmrahState();
}

class _DetailsQnAUmrahState extends State<DetailsQnAUmrah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.imageUrl),
              SizedBox(height: 8),
              Text(
                widget.title,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 4),
              Html(
                data: widget.desc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}