import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  final String appBarTitle;
  final String url;

  DetailPage(this.appBarTitle, this.url);

  @override
  State<StatefulWidget> createState() {
    return DetailPageState(appBarTitle, url);
  }
}

class DetailPageState extends State<DetailPage> {
  String appBarTitle;
  String url;

  bool loadFinish = false;

  WebViewController _controller;

  DetailPageState(this.appBarTitle, this.url);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(appBarTitle),
      ),
      body: new Center(
          child: WebView(
        initialUrl: url,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      )),
    );
  }
}
