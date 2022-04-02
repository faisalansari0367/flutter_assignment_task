import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/widgets/index.dart';

import '../../models/user/user.dart';

class ViewOwnProfile extends StatelessWidget {
  final User user;
  const ViewOwnProfile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      showBackButton: true,
      title: 'Profile details',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Full name'),
          Text(user.fullName),
          const Divider(),
          const Text('Email'),
          Text(user.email),
          const Divider(),
          const Text('Mobile No'),
          Text(user.mobileNo),
          const Divider(),
          const Text('Gender'),
          Text(user.gender),
          const Divider(),
          const Text('Name'),
          Text(user.name),
          const Divider(),
          const Text('Dob'),
          Text(dobFromDateTime(user.dob)),
        ],
      ),
    );
  }

  String dobFromDateTime(DateTime date) => '${date.year}-${inTensForm(date.month)}-${inTensForm(date.day)}';
  String inTensForm(int value) => value <= 10 ? '0$value' : value.toString();
}
