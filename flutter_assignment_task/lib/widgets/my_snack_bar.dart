import 'package:flutter/material.dart';

import '../constans.dart';

class MySnackBar {
  static final globalKey = GlobalKey<ScaffoldMessengerState>();
  static void show(String msg) {
    final context = globalKey.currentContext;
    if (context == null) return;
    final messenger = globalKey.currentState;
    final snackBar = SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
      margin: kMargin,
    );
    messenger?.removeCurrentSnackBar();
    messenger?.showSnackBar(snackBar);
  }
}
