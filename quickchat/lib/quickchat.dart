library quickchat;

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  final String url;
  final String title;

  const MyWebView({Key? key, required this.url,required this.title}) : super(key: key);

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late final WebViewController _webViewController;
  @override
  void initState() {
    _webViewController.loadRequest(Uri.parse("$widget.url"));
    _webViewController.enableZoom(false);
    _webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebViewWidget(
        controller: _webViewController,

      ),
    );
  }
}
