import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_qurban/details_qna_qurban.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_qurban/wp_api_qna_qurban.dart';

class QnAQurban extends StatefulWidget {
  @override
  _QnAQurbanState createState() => _QnAQurbanState();
}

class _QnAQurbanState extends State<QnAQurban> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Qna Qurban"),
      //   automaticallyImplyLeading: false, //to remove back button
      // ),
      body: Container(
        padding: const EdgeInsets.all(10.0).copyWith(bottom: 0),
        child: FutureBuilder(
          future: fetchWpPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map wppost = snapshot.data[index];

                  return PostTile(
                    href: wppost["_links"]["wp:featuredmedia"][0]["href"],
                    title: wppost["title"]["rendered"].replaceAll("#038;", ""),
                    desc: wppost["excerpt"]["rendered"],
                    content: wppost["content"]["rendered"],
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class PostTile extends StatefulWidget {
  final String href, title, desc, content;
  PostTile({this.href, this.title, this.desc, this.content});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  var imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsQnAQurban(
                        imageUrl: imageUrl,
                        title: widget.title,
                        desc: widget.content,
                      )));
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(height: 8),
                  Container(
                    height: 100,
                    width: 100,
                    child: FutureBuilder(
                        future: fetchWpPostImageUrl(widget.href),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            imageUrl = snapshot.data["media_details"]["sizes"]
                                ["woocommerce_thumbnail"]["source_url"];
                            return Image.network(
                                snapshot.data["media_details"]["sizes"]
                                    ["woocommerce_thumbnail"]["source_url"],
                                fit: BoxFit.cover);
                          }
                          return Center(child: CircularProgressIndicator());
                        }),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0).copyWith(bottom: 0),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ));
  }
}
