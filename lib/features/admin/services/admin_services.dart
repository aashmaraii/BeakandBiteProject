import 'dart:convert';
import 'dart:io';
import 'package:beakandbite/constants/error_handling.dart';
import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/features/admin/model/food_sales.dart';
import 'package:beakandbite/models/food.dart';
import 'package:beakandbite/models/services/myorder.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:beakandbite/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic("dru2sstt1", "faolsfmf");
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
      }
      Food food = Food(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price);

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: food.toJson(),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Product Added Successfully');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// Get all the products
  // Future<List<Food>> fetchAllFoods(BuildContext context) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   List<Food> foodList = [];
  //   try {
  //     http.Response res =
  //         await http.get(Uri.parse('$uri/admin/get-products'), headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'x-auth-token': userProvider.user.token,
  //     });
  //     httpErrorHandle(
  //         response: res,
  //         context: context,
  //         onSuccess: () {
  //           for (int i = 0; i < jsonDecode(res.body).length; i++) {
  //             foodList.add(Food.fromJson(jsonEncode(jsonDecode(res.body)[i])));
  //           }
  //         });
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  //   return foodList;
  // }

  Future<List<Food>> fetchAllFoods(BuildContext context) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  List<Food> foodList = [];

  try {
    http.Response res = await http.get(
      Uri.parse('$uri/admin/get-products'), // Updated URI to target the general endpoint
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      },
    );
    print(" response ${res.body}");
     httpErrorHandle(response: res, 
  context: context,
   onSuccess: (){
    for(int i=0; i<jsonDecode(res.body).length;i++){
      foodList.add(
        Food.fromJson(
          jsonEncode(
            jsonDecode(res.body)[i])));
    }
   });
  } catch (e) {
    // Handle errors
    showSnackBar(context, e.toString());
  }
  return foodList;
}


// Delete food
//   void deleteFood({required BuildContext context,
//   required Food food,
//   required VoidCallback onSuccess,})async{
//     final userProvider = Provider.of<UserProvider>(context,listen: false);
//     try{

//          http.Response res = await http.post(Uri.parse('$uri/admin/delete-product'),headers: {
// 'Content-Type': 'application/json; charset=UTF-8',
// 'x-auth-token':userProvider.user.token,
//          },
//          body: jsonEncode({
//             'id':food.id,
//          }),

//          );
//          httpErrorHandle(response: res, context: context, onSuccess: (){
//           onSuccess();
//          }
//          );

//     }catch (e){
//       showSnackBar(context, e.toString());
//     }

//   }
// }

  void deleteFood({
    required BuildContext context,
    required Food food,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': food.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
//   Future<List<Order>> fetchUserOrders(BuildContext context) async{
//      final userProvider = Provider.of<UserProvider>(context, listen: false);
//       List<Order> orderList = [];
//     try{

//       http.Response res = await http.get(Uri.parse('$uri/admin/get/user/orders'), headers: {
// 'Content-Type': 'application/json; charset=UTF-8',
// 'x-auth-token':userProvider.user.token,});
//   httpErrorHandle(response: res,
//   context: context,
//    onSuccess: (){
//     for (int i = 0; i < jsonDecode(res.body).length; i++){
//       orderList.add(
//         Order.fromJson(
//           jsonEncode(
//             jsonDecode(res.body)[i],
//             ),),);
//     }
//    });

//     }catch (e) {
//       showSnackBar(context, e.toString());
//     }
//    return orderList;
//   }

  Future<List<Order>> fetchUserOrders(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get/my-orders'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
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
    return orderList;
  }

  // void changeFoodOrderStatus({
  //   required BuildContext context,
  //   required int status,
  //   required VoidCallback onSuccess,
  //   required Order order,
  // }) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);

  //   try {
  //     http.Response res = await http.post(
  //       Uri.parse('$uri/admin/change-food-order-status'),
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'x-auth-token': userProvider.user.token,
  //       },
  //       body: jsonEncode({
  //         'id': order.id,
  //         'status': status,
  //       }),
  //     );

  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () {
  //         onSuccess();
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

  Future<Map<String, dynamic>> getFoodEarnings(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<FoodSales> foodSales = [];
    int totalEarning = 0;

    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/earning'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          var response = jsonDecode(res.body);
          totalEarning = response['totalOrderEarnings'];
          foodSales = [
            FoodSales('Momo', response['momoEarnings']),
            FoodSales('Noodles', response['noodleEarnings']),
          ];
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return {
      'foodSales': foodSales,
      'totalOrderEarnings': totalEarning,
    };
  }

  void changeFoodOrderStatus({
    required BuildContext context,
    required int status,
    required Order order,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/change-food-order-status'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': order.id,
          'status': status,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: onSuccess,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
