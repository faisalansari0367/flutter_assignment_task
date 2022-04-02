import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget? title;
  final double? elevation;
  final Color? iconColor;
  final bool leadingIsArrowBack;
  final PreferredSizeWidget? bottom;
  final bool showBottom;

  const MyAppBar({
    Key? key,
    this.actions,
    this.title,
    this.elevation,
    this.backgroundColor,
    this.iconColor,
    this.leadingIsArrowBack = false,
    this.bottom,
    this.showBottom = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: theme.backgroundColor,
        systemStatusBarContrastEnforced: true,
        statusBarIconBrightness: theme.brightness == Brightness.light ? Brightness.dark : Brightness.light,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: theme.canvasColor,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: theme.brightness == Brightness.light ? Brightness.dark : Brightness.light,
        // systemNavigationBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: backgroundColor,
      actions: actions,
      leading: leadingIsArrowBack
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              color: Theme.of(context).iconTheme.color)
          : null,
      title: title,
      titleTextStyle: theme.appBarTheme.titleTextStyle,
      elevation: elevation ?? 0.0,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(showBottom ? 100 : 50);
}
