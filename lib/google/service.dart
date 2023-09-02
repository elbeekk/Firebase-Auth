import 'package:allregistrationtypes/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooglePage extends StatefulWidget {
  GooglePage({super.key});

  @override
  State<GooglePage> createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {
   bool isLoggedIn = false;

  Map userObj = {};

  signInWithGoogle()async{
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken:googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),),(route) => false,);
  }

  @override
  Widget build(BuildContext context) {
    signInWithGoogle();
    return  const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
