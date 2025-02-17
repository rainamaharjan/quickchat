library quickchat;


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// A widget to display a WebView.
class MyWebView extends StatefulWidget {
  final String url;

  const MyWebView({Key? key, required this.url}) : super(key: key);

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WebView")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
