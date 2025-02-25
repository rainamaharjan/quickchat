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
          appBar: AppBar(title: Text('Chat Inbox',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.blueAccent,),
          body: QuickChat( url: 'https://www.google.com/')),
    );
  }
}