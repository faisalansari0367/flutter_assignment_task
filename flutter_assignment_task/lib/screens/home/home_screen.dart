import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/helpers/provider_helper.dart';
import 'package:flutter_assignment_task/helpers/redirect.dart';
import 'package:flutter_assignment_task/providers/user_model.dart';
import 'package:flutter_assignment_task/widgets/index.dart';

import '../update_profile/update_profile.dart';
import '../view_own_profile/view_own_profile.dart';
import 'widgets/add_contact_widget.dart';
import 'widgets/contacts_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = getProvider<UserModel>(context);
    return MyScaffold(
      floatingActionButton: FloatingActionButton(onPressed: onPressed, child: const Icon(Icons.add)),
      title: 'Welcome \n${provider.user!.name}',
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('View own profile'),
            leading: const Icon(Icons.supervised_user_circle),
            onTap: () => Redirect.to(
              context,
              ViewOwnProfile(
                user: provider.user!,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.edit),
            title: const Text('Update profile details'),
            onTap: () => Redirect.to(
              context,
              UpdateProfileScreen(
                user: provider.user!,
              ),
            ),
          ),
          const Divider(),
          Text(
            'Contacts List',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 1.height),
          const ContactsList(),
        ],
      ),
    );
  }

  void onPressed() {
    showModalBottomSheet(
      context: context,
      builder: builder,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
    );
  }

  Widget builder(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: AddContactWidget(),
    );
  }
}
