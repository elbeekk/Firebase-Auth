import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  var page;
  final bool isDone;
  Future? onTap;
  MyButton({
    super.key, required this.text, required this.icon,this.page,this.onTap, required this.isDone});


  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        if(page!=null){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  page,));

        }
        },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
        height: height1 * 0.07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isDone ? Colors.green.shade900.withOpacity(0.5):Colors.grey.shade800,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height1*.05,
              width: height1*.05,
              child:  Icon(icon,color: Colors.grey,size: 25,),
            ),
            Text(text,style: const TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w500),)
          ],
        ),
      ),);
  }
}