import 'package:allregistrationtypes/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser?.providerData;

    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(
            child: Column(
              children: [
                Text(user![0].displayName.toString(),style: const TextStyle(color: Colors.grey,fontSize: 15),),
                Text(user![0].email.toString(),style: const TextStyle(color: Colors.grey,fontSize: 15),),
                Text(user![0].providerId.toString(),style: const TextStyle(color: Colors.grey,fontSize: 15),),
              ],
            ),
          ),
          const SizedBox(height: 50,),
          GestureDetector(
              onTap: ()async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MyApp(),),(route) => false,);
                },
              child: const Text('Log out',style: TextStyle(color: Colors.red,fontSize: 12),))
        ],
      ),
    );
  }
}
