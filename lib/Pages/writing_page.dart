import 'package:flutter/material.dart';

class writingpage extends StatefulWidget {
  const writingpage({Key? key}) : super(key: key);

  @override
  State<writingpage> createState() => _writingpageState();
}

class _writingpageState extends State<writingpage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController TitleController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            TextField(
              maxLines: 3,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              controller: TitleController,
              autofocus: true,
              decoration: const InputDecoration.collapsed(
                hintStyle: TextStyle(fontSize: 30),
                hintText: "Title",
              ),
            ),
          ],
        ),
      ),
    );
  }
}