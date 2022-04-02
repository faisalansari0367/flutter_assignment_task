import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/providers/user_model.dart';
import 'package:provider/provider.dart';

class AddMultiProviders extends StatelessWidget {
  final Widget child;
  const AddMultiProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final recentProvider = RecentUsersProvider();
    final providers = [
      ChangeNotifierProvider(create: (context) => UserModel()),
      // ChangeNotifierProxyProvider<RecentUsersProvider, InstaProvider>(
      //   create: (context) => InstaProvider(),
      //   update: (context, value, previous) => previous!..setRecentUsers(value.recentUsers),
      // ),
      // ChangeNotifierProvider(create: (context) => ThemeProvider()),
      // ChangeNotifierProvider(create: (context) => DownloadedFilesProvider()),

      // ChangeNotifierProvider(create: (context) => DownloadProvider()),
      // ChangeNotifierProxyProvider(create: (context) => , update: (context, value, previous) => ,),

      //   ProxyProvider<RecentUsersProvider, InstaProvider>(
      //   update: (context, foo, previous) => InstaProvider(foo),
      // ),

      // ChangeNotifierProvider.value(value: RecentUsersProvider()),
    ];
    return MultiProvider(
      providers: providers,
      child: child,
    );
  }
}
