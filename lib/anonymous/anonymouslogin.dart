import 'package:allregistrationtypes/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AnonymousPage extends StatefulWidget {
  const AnonymousPage({super.key});

  @override
  State<AnonymousPage> createState() => _AnonymousPageState();
}

class _AnonymousPageState extends State<AnonymousPage> {
  Future<User?> signInAnonymously()async{
    try{
      var result = await FirebaseAuth.instance.signInAnonymously();
      var  user = result.user;
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),),(route) => false,);
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    signInAnonymously();
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
