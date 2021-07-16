import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsQnAUmrahHaji extends StatefulWidget {
  final String imageUrl, title, desc;
  DetailsQnAUmrahHaji({this.imageUrl, this.title, this.desc});
  @override
  _DetailsQnAUmrahHajiState createState() => _DetailsQnAUmrahHajiState();
}

class _DetailsQnAUmrahHajiState extends State<DetailsQnAUmrahHaji> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.imageUrl), fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.45),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      child: Container(
                        width: 150,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    SizedBox(height: 20),
                    Html(
                      data: widget.desc,
                      style: {
                        'html': Style(
                          textAlign: TextAlign.justify,
                          fontSize: FontSize(14),
                        ),
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // body: SingleChildScrollV6iew(
      //   child: Container(
      //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Image.network(widget.imageUrl),
      //         SizedBox(height: 8),
      //         Text(
      //           widget.title,
      //           style: TextStyle(fontSize: 18),
      //         ),
      //         SizedBox(height: 4),
      //         Html(
      //           data: widget.desc,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
