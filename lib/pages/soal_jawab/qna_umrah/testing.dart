// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:umrahhaji/pages/soal_jawab/qna_umrah/details_qna_umrah.dart';
// import 'package:umrahhaji/pages/soal_jawab/qna_umrah/wp_api_qna_umrah.dart';

// class TestingQnAUmrah extends StatefulWidget {
//   @override
//   _TestingQnAUmrahState createState() => _TestingQnAUmrahState();
// }

// class _TestingQnAUmrahState extends State<TestingQnAUmrah> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QnA Umrah"),
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
//                     href: wppost["_links"]["wp:featuredmedia"][0]["href"],
//                     title: wppost["title"]["rendered"]
//                         .replaceAll("&#038;", "")
//                         .replaceAll("&#8217;", "'"),
//                     desc: wppost["excerpt"]["rendered"],
//                     content: wppost["content"]["rendered"],
//                   );
//                 },
//               );
//             }
//             return CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }

// class PostTile extends StatefulWidget {
//   final String href, title, desc, content;
//   PostTile({this.href, this.title, this.desc, this.content});

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
//                 builder: (context) => DetailsQnAUmrah(
//                       imageUrl: imageUrl,
//                       title: widget.title,
//                       desc: widget.content,
//                     )));
//       },
//       child: Container(
//         child: Row(
//           children: [
//             Divider(
//               thickness: 1.0,
//             ),
//             Container(
//               width: 120,
//               height: 75,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: FutureBuilder(
//                     future: fetchWpPostImageUrl(widget.href),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         imageUrl = snapshot.data["media_details"]["sizes"]
//                             ["thumbnail"]["source_url"];
//                         return Image.network(snapshot.data["media_details"]
//                             ["sizes"]["thumbnail"]["source_url"]);
//                       }

//                       return Center(child: CircularProgressIndicator());
//                     }),
//               ),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.title,
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Html(
//                     data: widget.desc,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//               // margin: EdgeInsets.only(top: 8),
//               // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//               // child: Column(
//               //   crossAxisAlignment: CrossAxisAlignment.start,
//               //   children: [
//               //     Divider(),
//               //     Text(widget.title, style: TextStyle(fontSize: 16)),
//               //     SizedBox(height: 8),
//               //     Center(
//               //       child: FutureBuilder(
//               //           future: fetchWpPostImageUrl(widget.href),
//               //           builder: (context, snapshot) {
//               //             if (snapshot.hasData) {
//               //               imageUrl = snapshot.data["media_details"]["sizes"]
//               //                   ["thumbnail"]["source_url"];
//               //               return Image.network(snapshot.data["media_details"]
//               //                   ["sizes"]["thumbnail"]["source_url"]);
//               //             }

//               //             return Center(child: CircularProgressIndicator());
//               //           }),
//               //     ),
//               //     SizedBox(height: 5),
//               //     Html(
//               //       data: widget.desc,
//               //       // style: TextStyle(fontSize: 12)
//               //     )
//               //   ],
//               // ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  // const ContactUs({ Key? key }) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  // void launchWhatsapp({@required number, @required message}) async {
  //   String url = "https://api.whatsapp.com/send?phone=$number&text=$message";

  //   await canLaunch(url) ? launch(url) : print("Cannot open Whatsapp");
  // }

  void launchWhatsapp({
    @required phone,
    @required message,
  }) async {
    String url() {
      if (Platform.isAndroid) {
        // add the [https]
        return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
      } else {
        // add the [https]
        return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hubungi Kami'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              launchWhatsapp(
                  phone: "+60127095947",
                  message: "Testing whatsapp contact us");
            },
            child: Text("Open Whatsapp"),
          ),
        ),
      ),
    );
  }
}
