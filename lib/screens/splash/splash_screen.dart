import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/constans.dart';
import 'package:flutter_assignment_task/gen/assets.gen.dart';

import 'package:flutter_assignment_task/screens/login/login_screen.dart';

import '../../size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // static const duration = Duration(milliseconds: 2000);
  double opacity = 0.0;
  bool state = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final firstChild = Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: AnimatedOpacity(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 1000),
          opacity: opacity,
          child: Image.asset(
            Assets.icons.logo.path,
            fit: BoxFit.cover,
            width: Responsive.width(70),
          ),
        ),
      ),
    );

    const secondChild = LoginScreen();

    final animatedSwitcher = AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastOutSlowIn,
      child: state ? secondChild : firstChild,
    );

    return animatedSwitcher;

    // return AnnotatedRegion(
    //   value: SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     systemStatusBarContrastEnforced: true,
    //     statusBarIconBrightness: Brightness.light,
    //     systemNavigationBarContrastEnforced: true,
    //     systemNavigationBarColor: Colors.transparent,
    //     systemNavigationBarIconBrightness: Brightness.light,
    //   ),
    //   child: animatedSwitcher,
    // );
  }

  @override
  void initState() {
    // initialize all the providers;

    // handleTapFromNotification(context);
    navigate();
    super.initState();
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(milliseconds: 200), () {
      opacity = 1.0;
      setState(() {});
    });
    await Future.delayed(kSplashDuration, () async {
      state = true;
      setState(() {});
    });
  }
}
