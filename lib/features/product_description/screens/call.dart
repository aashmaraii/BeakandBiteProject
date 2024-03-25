import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:url_launcher/url_launcher.dart';

class CallFunc extends StatelessWidget {
  const CallFunc({super.key});

  // Uri dialNumber=Uri(scheme: 'tel',path: '9810589644');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(onPressed: ()
        {FlutterPhoneDirectCaller.callNumber('+9810589644');}, 
        child: const Icon(Icons.call),
        
        ),
        
      ),
      
    );
  }
}