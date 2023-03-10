import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medium_clone/Components/BottomBar.dart';
import 'SignInPage.dart';
import 'Pages/home.dart';

class AuthService {
  handleAuthState()
  {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot)
        {
          if(snapshot.hasData)
          {
            return const BottomBar();
          }
          else
          {
            return const GoogleSignInWidget();
          }
        }
    );
  }

  signInWithGoogle() async{
    //Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    //Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =  await googleUser!.authentication;

    //Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut()
  {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }
}