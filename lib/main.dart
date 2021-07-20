import 'package:bitcoin_viewer/pages/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        canvasColor: Colors.transparent
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            color: Colors.white,
            child: SearchPage(),
          )
        ),
      )
    );
  }
}
