
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  // final int maxLines;
  const CustomTextField({super.key,required this.controller,required this.hintText, });
  // this.maxLines = 1

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white
            ),
            
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
       validator: (val) {
         if(val == null || val.isEmpty){
          return 'Enter your $hintText';
         }return null;
       },
      //  maxLength: maxLines,
      ),
      
    );
  }
}