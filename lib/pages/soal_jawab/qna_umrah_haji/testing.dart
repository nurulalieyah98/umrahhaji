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
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        title: new Text("Qna Umrah Haji"),
        automaticallyImplyLeading: false, //to remove back button
      ),
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
    // final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;
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
                    child: FutureBuilder(
                        future: fetchWpPostImageUrl(widget.href),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            imageUrl = snapshot.data["media_details"]["sizes"]
                                ["thumbnail"]["source_url"];
                            return Image.network(
                              snapshot.data["media_details"]["sizes"]
                                  ["thumbnail"]["source_url"],
                              fit: BoxFit.cover,
                              height: 120,
                            );
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
        )

        // Container(
        //   height: 230,
        //   child: Stack(
        //     children: [
        //       Positioned(
        //         top: 35,
        //         left: 20,
        //         child: Material(
        //           child: Container(
        //             height: 180,
        //             width: width * 0.9,
        //             decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.circular(0.0),
        //                 boxShadow: [
        //                   BoxShadow(
        //                       color: Colors.grey.withOpacity(0.3),
        //                       offset: new Offset(-10.0, 10.0),
        //                       blurRadius: 20.0,
        //                       spreadRadius: 4.0)
        //                 ]),
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         top: 55,
        //         left: 30,
        //         child: Card(
        //           elevation: 10.0,
        //           shadowColor: Colors.grey.withOpacity(0.5),
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(15.0),
        //           ),
        //           child: Container(
        //             child: FutureBuilder(
        //                 future: fetchWpPostImageUrl(widget.href),
        //                 builder: (context, snapshot) {
        //                   if (snapshot.hasData) {
        //                     imageUrl = snapshot.data["media_details"]["sizes"]
        //                         ["thumbnail"]["source_url"];
        //                     return Image.network(snapshot.data["media_details"]
        //                         ["sizes"]["thumbnail"]["source_url"]);
        //                   }
        //                   return Center(child: CircularProgressIndicator());
        //                 }),
        //             height: 130,
        //             width: 130,
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10.0),
        //             ),
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         top: 40,
        //         left: 175,
        //         child: Container(
        //           alignment: Alignment.center,
        //           height: 180,
        //           width: 160,
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 widget.title,
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(fontSize: 12),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
