import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/size_config.dart';

import 'my_appbar.dart';

class MyScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool showBackButton;
  final Widget? floatingActionButton;
  const MyScaffold(
      {Key? key, this.title = '', required this.body, this.floatingActionButton, this.showBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      floatingActionButton: floatingActionButton,
      appBar: MyAppBar(
        leadingIsArrowBack: showBackButton,
        backgroundColor: theme.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.padding),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.height),
              Text(
                title,
                style: theme.textTheme.headline4,
              ),
              SizedBox(height: 3.height),
              body,
            ],
          ),
        ),
      ),
    );
  }
}
