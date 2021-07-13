// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class DesignEbook extends StatefulWidget {
//   DesignEbook({Key key, this.title}) : super(key: key);

//   final String title;
//   @override
//   _DesignEbookState createState() => _DesignEbookState();
// }

// class _DesignEbookState extends State<DesignEbook> {
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
//     return Container(
//       height: 350.0,
//       decoration: BoxDecoration(
//         color: Colors.orange,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('$progress%'),
//           SizedBox(
//             height: 10.0,
//           ),
//           isDownloaded
//               ? Text(
//                   'File Downloaded! You can see your file in the download file',
//                   textAlign: TextAlign.center,
//                 )
//               : Text(
//                   'Press the Button to start Downloading!',
//                   textAlign: TextAlign.center,
//                 ),
//           SizedBox(
//             height: 20.0,
//           ),
//           ElevatedButton(
//               child: Text('Download E-Book'),
//               onPressed: () async {
//                 downloadFile(uri, filename);
//               }),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesignEbook extends StatefulWidget {
  DesignEbook({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DesignEbookState createState() => _DesignEbookState();
}

class _DesignEbookState extends State<DesignEbook> {
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
    return Scaffold(
        appBar: AppBar(
          title: Text("E-Book Percuma"),
        ),
        backgroundColor: Colors.teal[100],
        body:
            profileView() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget profileView() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
          child: Stack(
            children: <Widget>[
              //Ebook Panduan Umrah dengan infografik berwarna yang bernilai RM59 secara PERCUMA sahaja. 😍
              //Semoga dengan panduan ini akan membantu para jemaah dapat menunaikan umrah dan haji dengan lebih sempurna.
              Image(
                image: AssetImage('assets/images/ebook.jpeg'),
                width: 400.0,
                height: 280.0,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
          // height: 100,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 4),
                child: Text(
                  "Ebook Panduan Umrah dengan infografik berwarna yang bernilai RM59 secara PERCUMA sahaja. 😍",
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono',
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 4),
                child: Text(
                  "Semoga dengan panduan ini akan membantu para jemaah dapat menunaikan umrah dan haji dengan lebih sempurna.",
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'RobotoMono',
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('$progress%'),
              SizedBox(
                height: 20.0,
              ),
              isDownloaded
                  ? Text(
                      'File Downloaded! You can see your file in the download file',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: 15.0,
                      ),
                    )
                  : Text(
                      'Press the Button to start Downloading!',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  child: Text('Download E-Book'),
                  onPressed: () async {
                    downloadFile(uri, filename);
                  }),
            ],
          ),
        ))
      ],
    );
  }
}
