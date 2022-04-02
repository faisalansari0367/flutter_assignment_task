import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String userId;

  DatabaseService(this.userId);

  final collection = FirebaseFirestore.instance.collection('users');

  CollectionReference<Map<String, dynamic>> getContacts() => collection.doc(userId.toString()).collection('contacts');

  Future<void> addContact({required String fullName, required String email, required String mobileNo}) async {
    final contacts = getContacts().doc();
    contacts.set({
      'full_name': fullName,
      'mobile_no': fullName,
      'email': email,
    }).then((value) => print('item added'));
  }

  Future<void> deleteContact(String id) async {
    getContacts().doc(id).delete().then((value) => print('item deleted'));
  }
}
