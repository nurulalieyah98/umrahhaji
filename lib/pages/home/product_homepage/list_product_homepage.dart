import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/home/product_homepage/details_product_homepage.dart';
import 'package:umrahhaji/pages/home/product_homepage/wp-product-homepage.dart';

//product
class PostTileProduct extends StatefulWidget {
  final String href, title, desc, content;
  PostTileProduct({this.href, this.title, this.desc, this.content});

  @override
  _PostTileProductState createState() => _PostTileProductState();
}

class _PostTileProductState extends State<PostTileProduct> {
  var imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        builder: (context) => DetailsHomePageProduct(
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
                    width: 200.0,
                    height: 130.0,
                    // ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FutureBuilder(
                          future: fetchWpPostImageUrlProduct(widget.href),
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
}
