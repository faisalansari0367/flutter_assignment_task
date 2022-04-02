import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/screens/splash/splash_screen.dart';
import 'package:flutter_assignment_task/widgets/index.dart';
import 'package:flutter_assignment_task/widgets/multi_providers.dart';

import 'widgets/size_config_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AddMultiProviders(
      child: SizeConfigWidget(
        child: MaterialApp(
          scaffoldMessengerKey: MySnackBar.globalKey,
          title: 'Flutter Assignment Task',
          theme: ThemeData(
            primarySwatch: Colors.pink,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
