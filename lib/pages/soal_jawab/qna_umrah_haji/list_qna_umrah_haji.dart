import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_umrah_haji/details_qna_umrah_haji.dart';
import 'package:umrahhaji/pages/soal_jawab/qna_umrah_haji/wp_api_qna_umrah_haji.dart';

class QnAUmrahHaji extends StatefulWidget {
  @override
  _QnAUmrahHajiState createState() => _QnAUmrahHajiState();
}

class _QnAUmrahHajiState extends State<QnAUmrahHaji> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Qna Umrah Haji"),
        automaticallyImplyLeading: false, //to remove back button
      ),
      body: Container(
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
                    title: wppost["title"]["rendered"]
                        .replaceAll("&#038;", "")
                        .replaceAll("&#8220;", "")
                        .replaceAll("&#8221;", "")
                        .replaceAll("&#8216;", "")
                        .replaceAll("&#8217;", "'"),
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
                  builder: (context) => DetailsQnAUmrahHaji(
                        imageUrl: imageUrl,
                        title: widget.title,
                        desc: widget.content,
                      )));
        },
        child: Container(
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 5,
                ),
                Text(widget.title, style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Center(
                  child: FutureBuilder(
                      future: fetchWpPostImageUrl(widget.href),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          imageUrl = snapshot.data["media_details"]["sizes"]
                              ["thumbnail"]["source_url"];
                          return Image.network(snapshot.data["media_details"]
                              ["sizes"]["thumbnail"]["source_url"]);
                        }

                        return Center(child: CircularProgressIndicator());
                      }),
                ),
                SizedBox(height: 5),
                Html(
                  data: widget.desc,
                  // style: TextStyle(fontSize: 12)
                )
              ],
            )));
  }
}
