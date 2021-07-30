import 'package:flutter/material.dart';
import 'package:umrahhaji/pages/home/home_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class ProductPage extends StatelessWidget {
  WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WillPopScope(
            onWillPop: () async {
              String url = await controller.currentUrl();
              if (url ==
                  "https://umrahhaji.com/kedai-kelengkapan-umrah-haji/") {
                return true;
              } else {
                controller.goBack();
                return false;
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text('Kelengkapan Umrah Haji'),
                centerTitle: true,
                backgroundColor: Colors.green[100],
                leading: BackButton(
                    color: Colors.white,
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()))),
              ),
              body: Container(
                child: SafeArea(
                    child: WebView(
                  initialUrl:
                      "https://umrahhaji.com/kedai-kelengkapan-umrah-haji/",
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController wc) {
                    controller = wc;
                  },
                )),
              ),
            )));
  }
}
