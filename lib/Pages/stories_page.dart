import 'package:flutter/material.dart';

class stories extends StatelessWidget {
  const stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget> [
        Center(child: Text("Your stories"))
      ],
    );
  }
}
