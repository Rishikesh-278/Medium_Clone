import 'package:flutter/material.dart';
import 'AuthService.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Medium",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 50),
              const Text(
                "Join Medium.",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 40),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                  label: const Text(
                    "Sign in with google", style: TextStyle(fontSize: 20),),
                  icon: const Icon(Icons.golf_course_outlined),
                  onPressed: () {
                    AuthService().signInWithGoogle();
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(350, 40),
                      //minimumSize: Size.fromHeight(50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      primary: Colors.transparent,
                      side: const BorderSide(color: Colors.white, width: 1))),
              // child: const Text(
              //   "Sign in with google",
              //   style: TextStyle(color: Colors.grey, fontSize: 20),
              // )), //Google Button
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  label: const Text(
                    "Sign in with Facebook", style: TextStyle(fontSize: 20),),
                  icon: const Icon(Icons.facebook),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(350, 40),
                      //minimumSize: Size.fromHeight(50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      primary: Colors.transparent,
                      side: const BorderSide(color: Colors.white, width: 1))),
              //Google Button
              const SizedBox(height: 30),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      height: 5,
                      thickness: 5,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text("Or"),
                  SizedBox(width: 5),
                  Expanded(
                    child: Divider(
                      height: 5,
                      thickness: 5,
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            ],
          ),)
        ,
      )
      ,
    );
  }
}
