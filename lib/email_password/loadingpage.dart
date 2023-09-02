import 'package:allregistrationtypes/email_password/inorup.dart';
import 'package:allregistrationtypes/email_password/sign_in.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Check your email!'),
            const SizedBox(height: 70,),
            const CircularProgressIndicator(),
            SizedBox(height: 20,),
            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Email(),));
                },
                child: const Text('Log in',style: TextStyle(color: Colors.blue),))
          ],
        ),
      ),
    );
  }
}
