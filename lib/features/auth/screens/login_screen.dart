import 'package:beakandbite/common/custom_button.dart';
import 'package:beakandbite/common/custom_textfield.dart';
import 'package:beakandbite/common/signIn_button.dart';
import 'package:beakandbite/features/auth/screens/auth_screens.dart';
import 'package:beakandbite/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  
   LoginScreen({super.key});
  final Authservice authService = Authservice();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signInUser(BuildContext context) {
    authService.signInUser(
      email: _emailController.text,
      context: context,
      password: _passwordController.text,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Image(
                      height: 260,
                      image: AssetImage('assets/images/logo.png')),
                Column(
                
                 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.0),
                      child:  Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                   const  SizedBox(height: 10,),
                    CustomTextField(
                      hintText: 'Email',
                      controller: _emailController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Password',
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 10),
                    MySignInButton(
                      text: 'Sign In',
                      onTap: () {
                        signInUser(context);
                      },
                    ),
                    const SizedBox(height: 15,),
                    GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=> const AuthScreen())),
                      child: const Center(
                        child:  Text(
                          ' Already Registered? Login',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}