import 'package:flutter/material.dart';
import 'package:medium_clone/Components/BottomBar.dart';

class Bookmark extends StatelessWidget {
  const Bookmark ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Home"),
        actions: [Icon(Icons.notifications)],
        elevation: 0,
      ),
    );
  }
}
