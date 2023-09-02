import 'package:allregistrationtypes/email_password/loadingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Reset1 extends StatefulWidget {
  const Reset1({super.key});

  @override
  State<Reset1> createState() => _Reset1State();
}

class _Reset1State extends State<Reset1> {
  final emailCon = TextEditingController();

  @override
  void dispose() {
    emailCon.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailCon.text);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Loading(),));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString().split(']')[1],
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey.shade800,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: emailCon,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GestureDetector(
              onTap: () {
                passwordReset();

              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(child: Text('Reset Password')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
