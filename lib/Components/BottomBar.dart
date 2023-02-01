import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medium_clone/Pages/Account.dart';
import 'package:medium_clone/Pages/bookmarks.dart';
import 'package:medium_clone/Pages/search.dart';
import 'package:medium_clone/Pages/home.dart';

import '../Pages/bookmarks.dart';
import '../Pages/search.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _CurrentIndex = 0;

  void onTapped(int index) {
    setState(() {
      _CurrentIndex = index;
    });
  }

  List Screens = [
    Home(),
    Search(),
    Bookmark(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_CurrentIndex],
      bottomNavigationBar: BottomAppBar(context),
    );
  }

  BottomNavigationBar BottomAppBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTapped,
      currentIndex: _CurrentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search_outlined),
            label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks_outlined),
            activeIcon: Icon(Icons.bookmarks_sharp),
            label: "Bookmarks"),
        BottomNavigationBarItem(
            icon: ImageIcon(NetworkImage(FirebaseAuth.instance!.currentUser!.photoURL!)),
            label: "Account"),
      ],
    );
  }
}
