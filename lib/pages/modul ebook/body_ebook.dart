import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/ebook.jpeg'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.teal[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text:
                            'Dapatkan ebook panduan umrah bernilai RM59 secara PERCUMA',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text:
                            'Semoga dengan panduan ini akan membantu para jemaah dapat menunaikan umrah dan haji dengan lebih sempurna.',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Text(
                    '$progress%',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 15.0,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreen,
                      ),
                      child: Text('Muat Turun Ebook'),
                      onPressed: () async {
                        downloadFile(uri, filename);
                      }),
                  SizedBox(height: 30),
                  isDownloaded
                      ? RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text:
                                  'Fail telah dimuat turun. Sila semak di fail muat turun anda.',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 14.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                          textAlign: TextAlign.center,
                        )
                      : RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Tekan butang untuk muat turun',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 14.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                          textAlign: TextAlign.center,
                        ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Gagal Muat Turun? ',
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
          ),
        ],
      ),
    );
  }
}
