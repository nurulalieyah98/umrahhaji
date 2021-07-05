import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class Ebook2 extends StatefulWidget {
  Ebook2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Ebook2State createState() => _Ebook2State();
}

class _Ebook2State extends State<Ebook2> {
  int progress = 0;

  ReceivePort _receivePort = ReceivePort();

  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");

    ///sending the data
    sendPort.send([id, status, progress]);
  }

  @override
  void initState() {
    super.initState();

    ///register a send port for the other isolates
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, "downloading");

    ///Listening for the data is comming other isolataes
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });

      print(progress);
    });

    FlutterDownloader.registerCallback(downloadingCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ebook Percuma"),
      ),
      body: Center(
        child: SingleChildScrollView(
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
                height: 30,
              ),
              ElevatedButton(
                child: Text("Muat Turun"),
                onPressed: () async {
                  final status = await Permission.storage.request();

                  if (status.isGranted) {
                    // Future<String> _getPath() {
                    //   return ExtStorage.getExternalStoragePublicDirectory(
                    //       ExtStorage.DIRECTORY_DOWNLOADS);
                    // }
                    // void externalDir() async {
                    //   await ExtStorage.getExternalStoragePublicDirectory(
                    //       ExtStorage.DIRECTORY_DOWNLOADS); // /storage/emulated/0/Download
                    // }
                    final externalDir =
                        await new Directory('/storage/emulated/0/Download')
                            .create(recursive: true);
                    print(externalDir);

                    final id = await FlutterDownloader.enqueue(
                      url:
                          // "https://umrahhaji.com/wp-content/uploads/2021/03/EBOOK-INFOGRAFIK-UMRAH-FEB-2021.pdf", (link lama)
                          "https://umrahhaji.com/wp-content/uploads/2021/06/EBOOK-INFOGRAFIK-UMRAH-2021.pdf",
                      savedDir: externalDir.path,
                      fileName: "EBOOK-INFOGRAFIK-UMRAH-2021.pdf",
                      showNotification: true,
                      openFileFromNotification: true,
                    );
                  } else {
                    Text("Unsuccessful to download");
                    print("Permission deined");
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Downloading file : " + "$progress" + "%",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
