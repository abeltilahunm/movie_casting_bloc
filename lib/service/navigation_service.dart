import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateToUsingPush(Widget route) {
    return navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => route));
  }

  Future<dynamic> navigateToUsingPushReplace(Widget route) {
    return navigatorKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (context) => route));
  }

  void popUntil() {
    return navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  void popPage() {
    return navigatorKey.currentState?.pop();
  }

  void popRepeated(int times) {
    if (times < 1) {
      times = 1;
    }
    var count = 0;
    var back = navigatorKey.currentState!.popUntil((route) => count++ == times);
    return back;
  }
}
