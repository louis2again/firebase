import 'dart:math';

import 'package:flutter/material.dart';
import 'package:workshops_flutter_firebase/firebase_client.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final FirebaseClient firebaseClient = FirebaseClient();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: StreamBuilder<List<User>>(
            stream: firebaseClient.getUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading.....');
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, position) {
                  return Container(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.8),
                        child: Text(
                          snapshot.data[position].name.toUpperCase(),
                          style: TextStyle(
                              fontSize: 32.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}

class User {
  final String name;

  User(this.name);
}
