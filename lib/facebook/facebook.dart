import 'package:allregistrationtypes/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class FacebookPage extends StatefulWidget {
  FacebookPage({super.key});

  @override
  State<FacebookPage> createState() => _FacebookPageState();
}

class _FacebookPageState extends State<FacebookPage> {
  Map userObj = {};

  @override
  void initState() {
    // signIn();
    socialFacebook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<bool?> signIn() async {
    FacebookAuth.instance.login(permissions: [
      'email',
      'public_profile',
    ]).then((value) {
      FacebookAuth.instance.getUserData().then((userData) async {
        userObj = userData;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false,
        );
      });
    });
  }

  Future<dynamic> socialFacebook() async {
    final fb = FacebookLogin();
    try{
      final user = await fb.logIn(permissions: []);

      final OAuthCredential credential = FacebookAuthProvider.credential(user.accessToken?.token ?? "hi");
      final userObj = await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
            (route) => false,
      );

      print(userObj);
    } catch (e){
      print(e.toString());
    }
  }






}
