import 'package:allregistrationtypes/phone/confirmPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PhonePage extends StatefulWidget {
  PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  String verId = '';

  TextEditingController numCon = TextEditingController();

  signInWithPhone() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: numCon.text,
      verificationCompleted: (phoneAuthCredential) {
        FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            error.message.toString(),
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
        ));
      },
      codeSent: (verificationId, forceResendingToken) {
        setState(() {
          verId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
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
          title: const Text('Phone'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                cursorColor: Colors.grey,
                controller: numCon,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    MaterialCommunityIcons.phone,
                    color: Colors.grey,
                  ),
                  hintText: 'Phone Number',
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  signInWithPhone();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmPage(
                          verId: verId,
                        ),
                      ));
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text('Send Code'),
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
