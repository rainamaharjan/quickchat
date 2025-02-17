import 'package:flutter/material.dart';
import 'package:quickchat/quickchat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Test Chat',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blueAccent,),
          body: MyWebView(
              title: 'Chat inbox', url: 'https://app.quickconnect.biz/')),
    );
  }
}
