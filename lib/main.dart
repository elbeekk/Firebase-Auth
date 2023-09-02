import 'package:allregistrationtypes/anonymous/anonymouslogin.dart';
import 'package:allregistrationtypes/email_password/inorup.dart';
import 'package:allregistrationtypes/facebook/facebook.dart';
import 'package:allregistrationtypes/google/service.dart';
import 'package:allregistrationtypes/mybutton.dart';
import 'package:allregistrationtypes/phone/withphone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ListView(

            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.2),
            children: [
              MyButton(
                text: 'Email/Password',
                icon: MaterialCommunityIcons.email,
                page: const Email(),
                isDone: true,
              ),
              MyButton(
                text: 'Phone',
                icon: MaterialCommunityIcons.phone,
                isDone: true,
                page: PhonePage(),
              ),
              MyButton(
                text: 'Anonymous',
                icon: Ionicons.person,
                page: const AnonymousPage(),
                isDone: true,
              ),
              MyButton(
                text: 'Google',
                icon: MaterialCommunityIcons.google,
                page: GooglePage(),
                isDone: true,
              ),

              MyButton(
                text: 'Facebook',
                icon: MaterialCommunityIcons.facebook,
                page: FacebookPage(),
                isDone: true,
              ),

            ],
          ),
        ),
      ),
      title: 'Registration',
      theme: ThemeData.dark(),
      color: Colors.grey.shade800,
    );
  }
}
