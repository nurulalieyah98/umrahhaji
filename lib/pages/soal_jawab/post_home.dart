import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_home.dart';

class PostHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green[100],
          title: Center(
            child: Container(
              child:
                  Image(image: AssetImage("assets/images/UH1.png"), height: 80),
            ),
          ),
          bottom: TabBar(indicatorWeight: 3.0, indicatorColor: Colors.black12,
              // labelPadding: EdgeInsets.all(5),
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Text(
                      "Artikel",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Text(
                      "Soal Jawab",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ),
                // Text(
                //   'Artikel',
                //   style: TextStyle(fontSize: 14, color: Colors.black54),
                // ),
                // Text(
                //   'Soal Jawab',
                //   style: TextStyle(fontSize: 14,color: Colors.black54),
                // )
              ]),
        ),
        body: TabBarView(
          children: <Widget>[
            ArticleHome(0xff000000),
            ArticleHome(0xff000000),
          ],
        ),
      ),
    );
  }
}
