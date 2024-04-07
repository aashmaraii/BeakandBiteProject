import 'package:flutter/material.dart';

class AdminTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const AdminTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1, required String text,
  }) : super(key: key);
 


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
            controller: controller,
          
          decoration: InputDecoration(border: InputBorder.none, hintText: hintText),
          validator: (val) {
           if(val == null || val.isEmpty){
            return 'Enter your $hintText';
           }return null;
         },
         maxLines: maxLines,
          
        ),
        
        
      ),
    );
  }
}
