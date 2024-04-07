// import 'package:beakandbite/try/address.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.pink.shade700,

      ),
      child: Center(child: GestureDetector(
        onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserAddressScreen(foodAmount: ,)));
        },
        child: const Text('Order',style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),),
      )),
    );
  }
}