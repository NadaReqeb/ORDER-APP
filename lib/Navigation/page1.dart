import 'package:flutter/material.dart';
import 'package:orderapp/router.dart';

import 'Page2.dart';

class Page1 extends StatelessWidget {
  static String routeName = 'Page1';
  String parameter;
  Page1({this.parameter});

  Future<bool> backIfCanPop(context) async {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      return Future.value(true);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('You Cant Go Back From Here!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('ok'))
              ],
            );
          });
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Page1'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              RouterClass.routerClass.pushToSpecificScreenUsingWidget(Page2());
            },
            child: Text('Go To Screen2'),
          ),
        ),
      ),
    );
  }
}
