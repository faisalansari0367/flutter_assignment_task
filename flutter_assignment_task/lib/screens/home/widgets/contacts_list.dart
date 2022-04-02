import 'package:flutter/material.dart';
import 'package:flutter_assignment_task/helpers/provider_helper.dart';
import 'package:flutter_assignment_task/providers/user_model.dart';
import 'package:flutter_assignment_task/size_config.dart';

import '../../../services/database_service.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  // CollectionReference get collection => FirebaseFirestore.instance.collection('contacts');
  late DatabaseService db;
  @override
  void initState() {
    super.initState();
    final provider = getProvider<UserModel>(context);
    db = DatabaseService(provider.user!.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: db.getContacts().snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 40.height,
            width: 100.width,
            child: Center(
              child: const CircularProgressIndicator.adaptive(),
            ),
          );
        }
        if (snapshot.data.docs.isEmpty) {
          return SizedBox(
            height: 40.height,
            width: 100.width,
            child: Align(
              alignment: Alignment.center,
              child: const Text('No records found'),
            ),
          );
        }
        return _listBuilder(snapshot.data.docs);
      },
    );
  }

  Widget _listBuilder(List data) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final item = data.elementAt(index);
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(item['full_name']),
          subtitle: Text(item['email']),
          trailing: IconButton(
            onPressed: () => db.deleteContact(item.id),
            icon: Icon(
              Icons.delete_forever,
              color: Theme.of(context).primaryColor,
            ),
          ),
        );
      },
    );
  }
}
