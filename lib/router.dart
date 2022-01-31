import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Navigation/Page2.dart';
import 'Navigation/page1.dart';

class RouterClass {
  RouterClass._();
  static RouterClass routerClass = RouterClass._();

  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  pushToSpecificScreenByName(String ScreenName) {
    navKey.currentState.pushNamed(ScreenName);
  }

  pushToSpecificScreenUsingWidget(Widget widget) {
    BuildContext context = navKey.currentContext;
    navKey.currentState.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

    popFunction() {
      navKey.currentState.pop();
    }

   Map<String, Widget Function(BuildContext)> map = {
    'screen1': (context) => Page1(),
    'screen2': (context) => Page2(),
  };
}

