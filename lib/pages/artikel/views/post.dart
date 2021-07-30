import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:umrahhaji/dashboard-wp.dart';

class Posts extends StatefulWidget {

  final String imageUrl, title, desc;

  Posts({this.imageUrl, this.title, this.desc});


  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(widget.title,
      //       style: TextStyle(color: Colors.black45),
      //     ),
      //     backgroundColor: Colors.green[100],
      //   leading: BackButton(
      //       color: Colors.black45,
      //   ),
      // ),
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
    );
  }
}


