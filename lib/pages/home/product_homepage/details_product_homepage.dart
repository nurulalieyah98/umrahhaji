import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsHomePageProduct extends StatefulWidget {
  final String imageUrl, title, desc, link;
  DetailsHomePageProduct({this.imageUrl, this.title, this.desc, this.link});
  @override
  _DetailsHomePageProductState createState() => _DetailsHomePageProductState();
}

class _DetailsHomePageProductState extends State<DetailsHomePageProduct> {
  WebViewController controller;
  String url;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WillPopScope(
            onWillPop: () async {
              url = widget.link;
              url = await controller.currentUrl();
              if (url == widget.link) {
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
                  initialUrl: widget.link,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController wc) {
                    controller = wc;
                  },
                )),
              ),
            )));
  }
}
