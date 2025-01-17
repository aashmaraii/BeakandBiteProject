import 'dart:convert';
import 'package:beakandbite/constants/error_handling.dart';
import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/constants/utils.dart';
// import 'package:beakandbite/features/home/widgets/food_for_you.dart';
import 'package:beakandbite/models/food.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// class HomeServices{

//   Future<List<Food>> fetchCategoriesFood({required BuildContext context, required String category
//   })async{
//     final userProvider = Provider.of<UserProvider>(context,listen: false);
//       List<Food> foodList =[];
//     try{
     
//       http.Response res = await http.get(Uri.parse('$uri/api/products?category=$category'),headers: {
// 'Content-Type': 'application/json; charset=UTF-8',
// 'x-auth-token':userProvider.user.token,});
//   httpErrorHandle(response: res, 
//   context: context,
//    onSuccess: (){
//     for(int i=0; i<jsonDecode(res.body).length;i++){
//       foodList.add(
//         Food.fromJson(
//           jsonEncode(
//             jsonDecode(res.body)[i])));
//     }
//    });

//     }catch(e){
//       showSnackBar(context, e.toString());
//     }
//    return foodList;
//   }
  
// }
class HomeServices {
  Future<List<Food>> fetchCategoriesProducts({
    required BuildContext context,
    required String category,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Food> foodList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/products?category=$category'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            foodList.add(
              Food.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return foodList;


    
  }

   


  

  // Future<Food> foodForYou({
  //   required BuildContext context,
    
  // }) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   Food food = Food(name: '', 
    
  //   description: '', 
    
  //   quantity: 0,
  //    images: [],
  //     category: '',
  //      price: 0);
  //   try {
  //     http.Response res = await http
  //         .get(Uri.parse('$uri/api/food-for-you'), headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'x-auth-token': userProvider.user.token,
  //     });

  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () {
  //        food = Food.fromJson(res.body);
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  //   return food;
  // }
}

