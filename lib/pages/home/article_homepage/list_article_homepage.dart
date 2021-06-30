import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/home/article_homepage/details_article_homepage.dart';

//article
class PostTileArticle extends StatefulWidget {
  final String href, title, desc, content;
  PostTileArticle({this.href, this.title, this.desc, this.content});

  @override
  _PostTileArticleState createState() => _PostTileArticleState();
}

class _PostTileArticleState extends State<PostTileArticle> {
  var imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => DetailsHomePageArticle(
        //                   imageUrl: imageUrl,
        //                   title: widget.title,
        //                   desc: widget.content,
        //                 )));
        //   },
        //   child: Container(
        //     color: Colors.orange[100],
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 120,
        //           height: 75,
        //           child: ClipRRect(
        //             borderRadius: BorderRadius.circular(8),
        //             child: FutureBuilder(
        //                 future: fetchWpPostImageUrl(widget.href),
        //                 builder: (context, snapshot) {
        //                   if (snapshot.hasData) {
        //                     imageUrl = snapshot.data["media_details"]["sizes"]
        //                         ["thumbnail"]["source_url"];
        //                     return Image.network(
        //                         snapshot.data["media_details"]["sizes"]
        //                             ["thumbnail"]["source_url"]);
        //                   }

        //                   return Center(child: CircularProgressIndicator());
        //                 }),
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 20,
        //         ),
        //         Expanded(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 widget.title,
        //                 style: TextStyle(
        //                   fontSize: 13,
        //                   color: Colors.black,
        //                 ),
        //               ),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               // Html(
        //               //   data: widget.desc,
        //               // ),
        //               const SizedBox(
        //                 height: 20,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        SingleChildScrollView(
          child: Card(
            //margin: EdgeInsets.only(bottom: 15.0),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              splashColor: Colors.deepOrangeAccent.withAlpha(30),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsHomePageArticle(
                              imageUrl: imageUrl,
                              title: widget.title,
                              desc: widget.content,
                            )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 3.0), //distance between image and border
                  Container(
                    // child: Image(
                    //   image: NetworkImage(url),
                    width: 250.0,
                    height: 130.0,
                    // ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FutureBuilder(
                          future: fetchWpPostImageUrlArticle(widget.href),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              imageUrl = snapshot.data["media_details"]["sizes"]
                                  ["thumbnail"]["source_url"];
                              return Image.network(
                                  snapshot.data["media_details"]["sizes"]
                                      ["thumbnail"]["source_url"]);
                            }

                            return Center(child: CircularProgressIndicator());
                          }),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(13.0, 12.0, 13.0, 8.0),
                    // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                    child: Column(
                      children: <Widget>[
                        Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold),
                        ),
                        // SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  fetchWpPostImageUrlArticle(String href) {}
}
