import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key?key,
  required this.text,
  required this.onTap,}):
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50)
      ),
       child: Text(text,));
    // Container(
    //   padding: const EdgeInsets.all(10),
    //   //margin: const EdgeInsets.symmetric(horizontal: 25),
    //   decoration: BoxDecoration(
    //     color: Colors.black,
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    //   child: const Text('Sign Up',
    //   style: TextStyle(
    //     color: Colors.white,
    //     fontWeight: FontWeight.bold,
    //     fontSize: 16,
    //   ),
    //   ),
      
    // );
  }
}