import 'package:flutter/material.dart';

class Redirect {
  static void to(context, page) {
    final route = MaterialPageRoute(builder: (context) => page);
    Navigator.push(context, route);
  }
}
