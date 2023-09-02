import 'package:allregistrationtypes/email_password/bylink.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();

  void signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailCon.text,
        password: passwordCon.text,
      );
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ByLink(),),(route) => true);
    } catch (e) {
      var snackBar = SnackBar(
        content: Text(
          e.toString().split(']')[1],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey.shade800,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextField(
              hint: 'Email',
              icon: MaterialCommunityIcons.email_outline,
              controller: emailCon,
              keyboard: TextInputType.emailAddress),
          MyTextField(
              hint: 'Password',
              icon: MaterialCommunityIcons.lock_outline,
              controller: passwordCon,
              keyboard: TextInputType.visiblePassword),
          GestureDetector(
            onTap: () {
              signup();

            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: height * 0.07,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text('Sign Up'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboard;

  const MyTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
