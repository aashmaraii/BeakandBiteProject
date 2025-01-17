import 'dart:convert';
import 'package:beakandbite/constants/error_handling.dart';
import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/constants/utils.dart';
import 'package:beakandbite/models/food.dart';
import 'package:beakandbite/models/user.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';

class CartServices{
   void removeFromCart({
    required BuildContext context,
    required Food food,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/api/remove-from-cart/${food.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//  void rateFood({
//     required BuildContext context,
//     required Food food,
//     required double rating,
   
//   })async{
//     final userProvider = Provider.of<UserProvider>(context,listen: false);
//     try{
//          http.Response res = await http.post(Uri.parse('$uri/api/rate-product'),headers: {
//     'Content-Type': 'application/json; charset=UTF-8',
//     'x-auth-token':userProvider.user.token,
//          },
//          body: jsonEncode({
//           'id':food.id!,
//           'rating': rating,
//          })

//          );
//          // ignore: use_build_context_synchronously
//          httpErrorHandle(response: res, context: context, onSuccess: (){
          
//          });
         
//     }catch (e){
//       showSnackBar(context, e.toString());
//     }
//   }
void rateFood({
    required BuildContext context,
    required Food food,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': food.id!,
          'rating': rating,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}





