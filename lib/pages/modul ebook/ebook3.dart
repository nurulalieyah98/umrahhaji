import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Ebook3 extends StatefulWidget {
  Ebook3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Ebook3State createState() => _Ebook3State();
}

class _Ebook3State extends State<Ebook3> {
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
    print('build running');

    return Scaffold(
      appBar: AppBar(
        title: Text("E-Book Percuma"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/ebook.jpeg'),
                width: 400.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('$progress%'),
              SizedBox(
                height: 10.0,
              ),
              isDownloaded
                  ? Text(
                      'File Downloaded! You can see your file in the download file',
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      'Press the Button to start Downloading!',
                      textAlign: TextAlign.center,
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
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.play_arrow),
      //     onPressed: () async {
      //       downloadFile(uri, filename);
      //     }),
    );
  }
}
