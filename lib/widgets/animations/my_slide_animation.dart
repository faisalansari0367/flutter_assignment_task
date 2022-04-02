import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/constans.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MySlideAnimation extends StatelessWidget {
  final Widget child;
  const MySlideAnimation({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      child: FadeInAnimation(
        curve: kCurve,
        delay: const Duration(milliseconds: 300),
        duration: kDuration,
        child: SlideAnimation(
          duration: const Duration(milliseconds: 500),
          verticalOffset: 10,
          child: child,
        ),
      ),
    );
  }
}
