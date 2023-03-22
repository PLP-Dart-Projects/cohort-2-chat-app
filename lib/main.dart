import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_chat_app/conversation.dart';
import 'package:demo_chat_app/users.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final db = FirebaseFirestore.instance;
          final usersCollection = db.collection('users');
          print("auth state changed");
          if (snapshot.hasData) {
            print("snapshot has data");
            print(snapshot.data);

            final user = usersCollection
                .where("uid", isEqualTo: snapshot.data?.uid)
                .get();
            user.then((snap) {
              if (snap.docs.length == 0) {
                usersCollection.add({
                  "uid": snapshot.data?.uid,
                  "name": snapshot.data?.displayName,
                  "email": snapshot.data?.email,
                });
              }
            }).onError((error, stackTrace) {
              print("Something wrong happend");
              print(error);
            });
            return UsersList();
          }

          print("snapshot has no data");

          return SignInScreen(
            providers: [
              EmailAuthProvider(),
            ],
          );
        },
      ),
      routes: {
        '/conversations': (context) => ConversationScreen(),
      },
    );
  }
}
