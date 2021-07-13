// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';

// class BodyEbook extends StatefulWidget {
//   BodyEbook({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _BodyEbookState createState() => _BodyEbookState();
// }

// class _BodyEbookState extends State<BodyEbook> {
//   bool downloading = false;

//   String progress = '0';

//   bool isDownloaded = false;

//   String uri =
//       'https://umrahhaji.com/wp-content/uploads/2021/06/EBOOK-INFOGRAFIK-UMRAH-2021.pdf'; // url of the file to be downloaded

//   String filename =
//       'EBOOK-INFOGRAFIK-UMRAH-2021.pdf'; // file name that you desire to keep

//   // downloading logic is handled by this method

//   Future<void> downloadFile(uri, fileName) async {
//     setState(() {
//       downloading = true;
//     });

//     String savePath = await getFilePath(fileName);

//     Dio dio = Dio();

//     dio.download(
//       uri,
//       savePath,
//       onReceiveProgress: (rcv, total) {
//         print(
//             'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');

//         setState(() {
//           progress = ((rcv / total) * 100).toStringAsFixed(0);
//         });

//         if (progress == '100') {
//           setState(() {
//             isDownloaded = true;
//           });
//         } else if (double.parse(progress) < 100) {}
//       },
//       deleteOnError: true,
//     ).then((_) {
//       setState(() {
//         if (progress == '100') {
//           isDownloaded = true;
//         }

//         downloading = false;
//       });
//     });
//   }

//   //gets the directory and path for the to-be downloaded file

//   // which will be used to save the file to that path in the downloadFile method

//   Future<String> getFilePath(uniqueFileName) async {
//     String path = '';

//     var dir = Directory('/storage/emulated/0/Download');

//     path = '${dir.path}/$uniqueFileName.pdf';

//     return path;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           SingleChildScrollView(
//             child: SizedBox(
//               //it provide us total height
//               height: MediaQuery.of(context).size.height,
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(
//                         //adjust ketinggian
//                         top: MediaQuery.of(context).size.height * 0.4),
//                     padding: EdgeInsets.only(
//                       top: MediaQuery.of(context).size.height * 0.12,
//                       left: 20.0,
//                       right: 20.0,
//                     ),
//                     // height: 500,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(24),
//                         topRight: Radius.circular(24),
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: <Widget>[
//                       SizedBox(height: 30),
//                       Image(
//                         image: AssetImage('assets/images/ebook.jpeg'),
//                         width: 400.0,
//                         height: 260.0,
//                         alignment: Alignment.center,
//                       ),
//                       SizedBox(height: 80),
//                       Text(
//                           "Ebook Panduan Umrah dengan infografik berwarna yang bernilai RM59 secara PERCUMA sahaja. 😍",
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.fredokaOne(
//                               textStyle: TextStyle(
//                             fontSize: 15.0,
//                             color: Colors.black,
//                           ))),
//                       SizedBox(height: 30),
//                       Text(
//                         "Semoga dengan panduan ini akan membantu para jemaah dapat menunaikan umrah dan haji dengan lebih sempurna.",
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.patrickHand(
//                           textStyle: TextStyle(
//                             fontSize: 16.0,
//                             fontStyle: FontStyle.italic,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30),
//                       Text(
//                         '$progress%',
//                         style: GoogleFonts.fredokaOne(
//                           textStyle: TextStyle(
//                             fontSize: 15.0,
//                             fontStyle: FontStyle.italic,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30),
//                       ElevatedButton(
//                           child: Text('Download E-Book'),
//                           onPressed: () async {
//                             downloadFile(uri, filename);
//                           }),
//                       SizedBox(height: 30),
//                       isDownloaded
//                           ? Text(
//                               'File Downloaded! You can see your file in the download file',
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.zcoolQingKeHuangYou(
//                                 textStyle: TextStyle(
//                                   fontSize: 15.0,
//                                   fontStyle: FontStyle.italic,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             )
//                           : Text(
//                               'Press the Button to start Downloading!',
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.zcoolQingKeHuangYou(
//                                 textStyle: TextStyle(
//                                   fontSize: 15.0,
//                                   fontStyle: FontStyle.italic,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                       SizedBox(
//                         height: 40.0,
//                       ),
//                       RichText(
//                         textAlign: TextAlign.center,
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'Gagal Muat Turun ? ',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             TextSpan(
//                                 text: 'Tekan Disini',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.red,
//                                 ),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                     launch(
//                                         'https://umrahhaji.com/wp-content/uploads/2021/06/EBOOK-INFOGRAFIK-UMRAH-2021.pdf');
//                                   }),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyEbook extends StatefulWidget {
  BodyEbook({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BodyEbookState createState() => _BodyEbookState();
}

class _BodyEbookState extends State<BodyEbook> {
  bool downloading = false;

  String progress = '0';

  bool isDownloaded = false;

  String uri =
      'https://umrahhaji.com/wp-content/uploads/2021/06/EBOOK-INFOGRAFIK-UMRAH-2021.pdf'; // url of the file to be downloaded

  String filename =
      'EBOOK-INFOGRAFIK-UMRAH-2021.pdf'; // file name that you desire to keep

  // downloading logic is handled by this method

  Future<void> downloadFile(uri, fileName) async {
    setState(() {
      downloading = true;
    });

    String savePath = await getFilePath(fileName);

    Dio dio = Dio();

    dio.download(
      uri,
      savePath,
      onReceiveProgress: (rcv, total) {
        print(
            'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');

        setState(() {
          progress = ((rcv / total) * 100).toStringAsFixed(0);
        });

        if (progress == '100') {
          setState(() {
            isDownloaded = true;
          });
        } else if (double.parse(progress) < 100) {}
      },
      deleteOnError: true,
    ).then((_) {
      setState(() {
        if (progress == '100') {
          isDownloaded = true;
        }

        downloading = false;
      });
    });
  }

  //gets the directory and path for the to-be downloaded file

  // which will be used to save the file to that path in the downloadFile method

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    var dir = Directory('/storage/emulated/0/Download');

    path = '${dir.path}/$uniqueFileName.pdf';

    return path;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Image(
            image: AssetImage('assets/images/ebook.jpeg'),
            width: 400.0,
            height: 260.0,
            alignment: Alignment.center,
          ),
          SizedBox(height: 30),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 30.0,
                left: 20.0,
                right: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                      "Ebook Panduan Umrah dengan infografik berwarna yang bernilai RM59 secara PERCUMA sahaja. 😍",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.fredokaOne(
                          textStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ))),
                  SizedBox(height: 30),
                  Text(
                    "Semoga dengan panduan ini akan membantu para jemaah dapat menunaikan umrah dan haji dengan lebih sempurna.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.patrickHand(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    '$progress%',
                    style: GoogleFonts.fredokaOne(
                      textStyle: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      child: Text('Download E-Book'),
                      onPressed: () async {
                        downloadFile(uri, filename);
                      }),
                  SizedBox(height: 30),
                  isDownloaded
                      ? Text(
                          'File Downloaded! You can see your file in the download file',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.zcoolQingKeHuangYou(
                            textStyle: TextStyle(
                              fontSize: 15.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : Text(
                          'Press the Button to start Downloading!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.zcoolQingKeHuangYou(
                            textStyle: TextStyle(
                              fontSize: 15.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Gagal Muat Turun ? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                            text: 'Tekan Disini',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launch(
                                    'https://umrahhaji.com/wp-content/uploads/2021/06/EBOOK-INFOGRAFIK-UMRAH-2021.pdf');
                              }),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
