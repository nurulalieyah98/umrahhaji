import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
                backgroundColor: Colors.teal,
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
