import 'dart:async';
import 'package:allregistrationtypes/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ByLink extends StatefulWidget {
  ByLink({super.key});
  late Timer timer;
  @override
  State<ByLink> createState() => _ByLinkState();
}

class _ByLinkState extends State<ByLink> {
  void send() async {
    try{
      FirebaseAuth.instance.currentUser?.sendEmailVerification();
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void push()async{
    widget.timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      if( FirebaseAuth.instance.currentUser!.emailVerified){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
        widget.timer.cancel();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    send();
    push();
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Link'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Check your email!'),
            SizedBox(height: 20,),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
