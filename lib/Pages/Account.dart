import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medium_clone/Components/BottomBar.dart';
import 'package:medium_clone/Pages/about_page.dart';
import 'package:medium_clone/Pages/list_page.dart';
import 'package:medium_clone/Pages/stories_page.dart';

// class AccountPage extends StatelessWidget {
//   const AccountPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Account"),
//         actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
//       ),
//       body: Account(),
//     );
//   }
// }

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
                ProfileDetails(context), //profile details
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromHeight(40),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(color: Colors.white, width: 1)),
                        child: const Text(
                          "View stats",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ), //View stats button
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(40),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(color: Colors.white, width: 1)),
                        child: const Text(
                          "Edit profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ), //Edit profile button
                    const SizedBox(width: 15),
                  ],
                ), //stats and edit button
              ],
            ),
            TabBar(tabs: [
              Tab(text: "Stories"),
              Tab(text: "List"),
              Tab(text: "About")
            ]),
            TabBarView(children: [
              stories(),
              list(),
              about(),
            ]),
          ],
        ),
      ),
    );
  }
}

Padding ProfileDetails(BuildContext context) {
  if (FirebaseAuth.instance.currentUser == null) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Container(),
    );
  }

  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundImage:
                (NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!)),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(FirebaseAuth.instance.currentUser!.displayName!),
                Row(
                  children: const <Widget>[
                    Text("Followers", style: TextStyle(fontSize: 20)),
                    SizedBox(width: 5),
                    Text(".", style: TextStyle(fontSize: 20)),
                    SizedBox(width: 5),
                    Text("Following", style: TextStyle(fontSize: 20))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

/*

 */
