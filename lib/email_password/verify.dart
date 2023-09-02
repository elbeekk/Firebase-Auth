import 'dart:async';

import 'package:allregistrationtypes/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyYourEmail extends StatefulWidget {
  VerifyYourEmail({super.key});
  late Timer timer;
  @override
  State<VerifyYourEmail> createState() => _VerifyYourEmailState();
}

class _VerifyYourEmailState extends State<VerifyYourEmail> {
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
    return  const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Verify your email'),
            SizedBox(height: 20,),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
