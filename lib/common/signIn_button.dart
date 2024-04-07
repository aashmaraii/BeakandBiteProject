import 'package:flutter/material.dart';

class MySignInButton extends StatelessWidget {
   final String text;
  final VoidCallback onTap;
  const MySignInButton({Key?key,
  required this.text,
  required this.onTap,}):
  super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white70,
        borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
        ),
      ),
    );
  }
}