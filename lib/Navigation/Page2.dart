import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  static String routeName = 'Page2';
  String message;
  Page2({this.message = 'no data'});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(widget.message),
        ),
        body: Center(
          child: Text(widget.message),
        ),
      ),
    );
  }
}

class Page2Arguments {
  String message;
  String title;
  Page2Arguments({this.message, this.title});
}
