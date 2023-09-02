import 'package:allregistrationtypes/email_password/sign_in.dart';
import 'package:allregistrationtypes/email_password/sign_up.dart';
import 'package:allregistrationtypes/mybutton.dart';
import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  const Email({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Email'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(text: 'Sign in          ', icon: null,page:  SignIn(),isDone: true,),
          MyButton(text: 'Sign up          ', icon: null,page: SignUp(),isDone: true),
        ],
      ),
    );
  }
}
