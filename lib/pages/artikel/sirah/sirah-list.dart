import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/artikel/sirah/sirah-api.dart';
import 'package:umrahhaji/pages/artikel/sirah/sirah-post.dart';
//import 'package:flutter_html/flutter_html.dart';

class SirahList extends StatefulWidget {
  @override
  _SirahListState createState() => _SirahListState();
}

class _SirahListState extends State<SirahList> {
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
                  return SirahPostTile(
                      href: wppost["_links"]["wp:featuredmedia"][0]["href"],
                      title: wppost['title']['rendered']
                          .replaceAll("&#8211; ", "")
                          .replaceAll("1928", "")
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

class SirahPostTile extends StatefulWidget {
  final String href, title, desc, content;
  SirahPostTile({this.href, this.title, this.desc, this.content});

  @override
  _SirahPostTileState createState() => _SirahPostTileState();
}

class _SirahPostTileState extends State<SirahPostTile> {
  var imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SirahPosts(
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
