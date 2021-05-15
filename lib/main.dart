import 'package:bitcoin_viewer/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Test()
    );
  }
}
