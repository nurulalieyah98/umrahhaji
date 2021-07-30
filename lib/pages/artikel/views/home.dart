// import 'package:flutter/material.dart';
// //import 'package:flutter_html/flutter_html.dart';
// import 'package:umrahhaji/posts/artikel/views/post.dart';
// import 'package:umrahhaji/posts/wp-api.dart';

// class HomePosts extends StatefulWidget {
//   @override
//   _HomePostsState createState() => _HomePostsState();
// }

// class _HomePostsState extends State<HomePosts> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Artikel"),
//       ),
//       body: Container(
//         child: FutureBuilder(
//           future: fetchWpPosts(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   Map wppost = snapshot.data[index];
//                   return PostTile(
//                       href: wppost["_links"]["wp:featuredmedia"][0]["href"],
//                       title: wppost['title']['rendered']
//                           .replaceAll("1928 &#8211; ", "")
//                       // desc: wppost['excerpt']['rendered'],
//                       // content: wppost['content']['rendered']
//                       );
//                 },
//               );
//             }
//             return Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
//   }
// }

// class PostTile extends StatefulWidget {
//   final String href, title, desc, content;
//   PostTile({this.href, this.title, this.desc, this.content}); //

//   @override
//   _PostTileState createState() => _PostTileState();
// }

// class _PostTileState extends State<PostTile> {
//   var imageUrl = "";

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => Posts(
//                       imageUrl: imageUrl,
//                       title: widget.title,
//                       desc: widget.content,
//                     )));
//       },
//       child: Card(
//         clipBehavior: Clip.antiAlias,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Stack(alignment: Alignment.center, children: [
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Container(
//                   height: 100,
//                   width: 100,
//                   child: FutureBuilder(
//                       future: fetchWpPostImageUrl(widget.href),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           imageUrl = snapshot.data["media_details"]["sizes"]
//                               ["woocommerce_thumbnail"]["source_url"];
//                           return Image.network(snapshot.data["media_details"]
//                               ["sizes"]["woocommerce_thumbnail"]["source_url"], fit: BoxFit.cover, height: 120,);
//                         }

//                         return Center(child: CircularProgressIndicator());
//                       }),
//                 ),
//               ]),
//               SizedBox(height: 8),
//               Flexible(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0).copyWith(bottom: 0),
//                   child: Text(widget.title,
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//                 ),
//               ),
//               SizedBox(height: 8),
//             ],
//           ),
//         ),
//     );
//   }
// }