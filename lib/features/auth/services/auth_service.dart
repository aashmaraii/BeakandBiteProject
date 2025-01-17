import 'dart:convert';
// import 'package:beakandbite/common/bottom_bar.dart';
import 'package:beakandbite/common/bottom_bar.dart';
import 'package:beakandbite/constants/error_handling.dart';
import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/constants/utils.dart';
// import 'package:beakandbite/features/home/screens/home_screen.dart';
import 'package:beakandbite/models/user.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Authservice{

  void signUpUser({
    required String email,
    required BuildContext context, 
    required String password,
    required String name,
  })async{
    try{
      User user = User(id: '', 
      email: email,name: name, password: password, 
      address: '', type: '',
       token: '',
       cart: [],
       favourites: [],
       );
     http.Response res = await http.post(Uri.parse('$uri/api/signup'
      ),
      body: user.toJson(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
      );
      httpErrorHandle(response: res, 
      context: context, onSuccess: (){
        showSnackBar(context, 'Account has been created');
      },
      );
    }catch (e) {
      showSnackBar(context, e.toString());


    }
  }
  // sign in user
  void signInUser({
    required String email,
    required BuildContext context, 
    required String password,
   
  })async{
    try{
     http.Response res = await http.post(Uri.parse('$uri/api/signin'
      ),
      body: jsonEncode({
        'email':email,
        'password':password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
      );
      print(res.body);
      httpErrorHandle
      (response: res, 
      context: context, 
      onSuccess: ()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
       Provider.of<UserProvider>(context, listen: false).setUser(res.body);
      await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
     Navigator.pushNamedAndRemoveUntil(context, 
     BottomBar.routeName, (route) => false);
      },
      );
    }catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  void getUserData(
     BuildContext context, 
  )async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if(token == null){
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
      headers: <String,String>{
           'Content-Type': 'application/json; charset=UTF-8',
           'x-auth-token':token!
      }
      );
      var response = jsonDecode(tokenRes.body);
      if(response == true){
        http.Response userRes = await http.get(Uri.parse('$uri/'),
        headers: <String,String>{
           'Content-Type': 'application/json; charset=UTF-8',
           'x-auth-token':token
      },
        );
        var userProvider = Provider.of<UserProvider>(context,listen: false);
        userProvider.setUser(userRes.body);

      }
    }catch (e) {
      showSnackBar(context, e.toString());


    }
  }

}
// "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1Y2E1M2NiZDVhYWJhNjBkMDk2Mzg3NCIsImlhdCI6MTcwNzc1ODU4N30._Gol_ePDkdjHCXkxMNtkGC55liJcLsMkRtTv0GO0koo",