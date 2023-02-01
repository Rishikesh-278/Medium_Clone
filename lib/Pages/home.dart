import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medium_clone/AuthService.dart';
import 'package:medium_clone/Components/BottomBar.dart';
import 'notifications.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications()));
              },
              icon: Icon(Icons.notifications))
        ],
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                AuthService().signOut();
              },
              child: Text("Logout")),
          Image.network(FirebaseAuth.instance!.currentUser!.photoURL!),
        ],
      ),
    );
  }
}
