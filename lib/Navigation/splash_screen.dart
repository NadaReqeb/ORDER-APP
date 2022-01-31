// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../order_main_page.dart';
import '../router.dart';

class SplachScreen extends StatefulWidget {
  
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  
  NavigationFunction(context) async {
    await Future.delayed(Duration(seconds: 3));
    RouterClass.routerClass.pushToSpecificScreenUsingWidget(OrderMainPage());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NavigationFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: (Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Logo.png"),
                      fit: BoxFit.fitWidth))))),
    );
  }
}
