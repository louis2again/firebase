import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';

class FirebaseClient {
  Stream<List<User>> getUsers() {
    return Firestore.instance.collection('users').snapshots().map(
        (querySnapshot) => querySnapshot.documents
            .map((documentSnapshot) => User(documentSnapshot['name']))
            .toList());
  }
}
