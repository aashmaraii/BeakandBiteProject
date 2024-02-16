
import 'dart:convert';

import 'package:beakandbite/constants/error_handling.dart';
import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/constants/utils.dart';
import 'package:beakandbite/models/food.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class SearchServices{
  Future<List<Food>> fetchFood({
    required BuildContext context,
    required String searchQuery,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Food> foodList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/products/search/$searchQuery'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      // ignore: use_build_context_synchronously
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
}
