import 'package:allregistrationtypes/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ConfirmPage extends StatefulWidget {
  final String verId;

  ConfirmPage({
    super.key,
    required this.verId,
  });

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  TextEditingController numCon = TextEditingController();

  void confirm() {
    try {
      var confirmation = PhoneAuthProvider.credential(
          verificationId: widget.verId, smsCode: numCon.text);
      print('confirmation $confirmation');
      print('confirmation $confirmation');
      FirebaseAuth.instance.signInWithCredential(confirmation);
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
              (route) => false,);
      }
    } catch (e) {
      print(Text(e.toString().split(']')[1]));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString().split(']')[1])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("Confirmation"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                cursorColor: Colors.grey,
                controller: numCon,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    MaterialCommunityIcons.lock,
                    color: Colors.grey,
                  ),
                  hintText: 'OTP code',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  confirm();
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text('Confirm'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
