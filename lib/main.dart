import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medium_clone/AuthService.dart';
import 'SignInPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(
    home: MyApp(),
    theme: ThemeData.dark(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthService().handleAuthState();
  }
}
