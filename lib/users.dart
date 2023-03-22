import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/conversations',
                  arguments: {
                    "user": "user${index + 1}",
                  },
                );
              },
              leading: CircleAvatar(
                child: Text("${index + 1}"),
              ),
              title: Text("User ${index + 1}"),
              subtitle: Text("user${index + 1}@example.com"),
            );
          },
        ),
      ),
    );
  }
}
