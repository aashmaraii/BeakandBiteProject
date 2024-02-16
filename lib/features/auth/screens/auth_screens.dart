import 'package:beakandbite/common/custom_button.dart';
import 'package:beakandbite/common/custom_textfield.dart';
import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth{
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;

  final _signUpFormKey = GlobalKey<FormState>();
   final _signInFormKey = GlobalKey<FormState>();
  final Authservice authService = Authservice();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _nameController = TextEditingController();

  
   @override
   void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
   }
   void signUpUser(){
    authService.signUpUser(email: _emailController.text, context: context, password: _passwordController.text, name: _nameController.text);
   }
    void signInUser(){
    authService.signInUser(
      email: _emailController.text, 
      context: context, 
      password: _passwordController.text, 
      );
   }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            
            if(_auth == Auth.signup)
            Form(key: _signUpFormKey,
            child: Column(
              children: [
                Row(
              children: [
                const Text('Register',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              ),
              Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup, 
                groupValue: _auth, 
                onChanged: (Auth?val){
                  setState(() {
                    _auth = val!;
                  });

                }),
              ],
            ),
                CustomTextField(
                  hintText: 'Email',
                  controller: _emailController),
                  const SizedBox(height: 10,),
                  CustomTextField(
                  hintText: 'FullName',
                  controller: _nameController),
                       const SizedBox(height: 10,),
                  CustomTextField(
                  hintText: 'Password',
                  controller: _passwordController),
                  const SizedBox(height: 10,),
                   CustomButton(text: 
                  'Sign Up',
                  onTap:() {
                    if(_signUpFormKey.currentState!.validate()){
                      signUpUser();
                    }
                  },),

              ],
            ),
            ),
            Visibility(
              visible: _auth == Auth.signup,
              child: Row(
                children: [
                  const Text(' Already Registered? Sign-in',
                style: TextStyle(
                  fontSize: 16,
                ),
                ),
                Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin, 
                  groupValue: _auth, 
                  onChanged: (Auth?val){
                    setState(() {
                      _auth = val!;
                    });
              
                  }),
                ],
              ),
            ),
            if(_auth == Auth.signin)
            Form(key: _signInFormKey,
            child: Column(
              children: [
                const Text('Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              ),
                CustomTextField(
                  hintText: 'Email',
                  controller: _emailController),
                  const SizedBox(height: 10,),
                  CustomTextField(
                  hintText: 'Password',
                  controller: _passwordController),
                  const SizedBox(height: 10,),
                   CustomButton(text: 
                  'Sign In',
                  onTap:() {
                    if(_signInFormKey.currentState!.validate()){
                      signInUser();
                    }
                    
                  },),

              ],
            ),
            ),
            Visibility(
              visible: _auth == Auth.signin,
              child: Row(
                children: [
                  const Text(' Are you a new user? Register',
                style: TextStyle(
                  fontSize: 16,
                ),
                ),
                Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup, 
                  groupValue: _auth, 
                  onChanged: (Auth?val){
                    setState(() {
                      _auth = val!;
                    });
              
                  }),
                ],
              ),
            ),
            
          ],
        ),
        
      ),
      ),
    );
  }
}