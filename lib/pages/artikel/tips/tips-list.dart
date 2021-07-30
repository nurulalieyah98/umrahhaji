import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/artikel/tips/tips-api.dart';
import 'package:umrahhaji/pages/artikel/tips/tips-post.dart';
//import 'package:flutter_html/flutter_html.dart';

class TipsList extends StatefulWidget {
  @override
  _TipsListState createState() => _TipsListState();
}

class _TipsListState extends State<TipsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text("Berita Haramain"),
      //   ),
      body: Container(
        padding: const EdgeInsets.all(10.0).copyWith(bottom: 0),
        child: FutureBuilder(
          future: fetchWpPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map wppost = snapshot.data[index];
                  return TipsPostTile(
                      href: wppost["_links"]["wp:featuredmedia"][0]["href"],
                      title: wppost['title']['rendered']
                          .replaceAll("1928 &#8211; ", "")
                          .replaceAll("&#8217;", ""),
                      desc: wppost['excerpt']['rendered'],
                      content: wppost['content']['rendered']);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class TipsPostTile extends StatefulWidget {
  final String href, title, desc, content;
  TipsPostTile({this.href, this.title, this.desc, this.content});

  @override
  _TipsPostTileState createState() => _TipsPostTileState();
}

class _TipsPostTileState extends State<TipsPostTile> {
  var imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TipsPosts(
                      imageUrl: imageUrl,
                      title: widget.title,
                      desc: widget.content,
                    )));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.center, children: [
              SizedBox(
                height: 8,
              ),
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
                          fit: BoxFit.cover,
                          height: 120,
                        );
                      }

                      return Center(child: CircularProgressIndicator());
                    }),
              ),
            ]),
            SizedBox(height: 8),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0).copyWith(bottom: 0),
                child: Text(widget.title, style: TextStyle(fontSize: 12)),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
