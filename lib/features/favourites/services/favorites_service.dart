import 'dart:convert';

import 'package:beakandbite/constants/error_handling.dart';
import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/constants/utils.dart';
import 'package:beakandbite/models/food.dart';
import 'package:beakandbite/models/user.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class FavouriteServices{
  Future<List<Food>> handleFavourites({
    required BuildContext context,
    required String id,
  })async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
  List<Food> favouriteList = [];
    try {
      http.Response res = await http.put(
        Uri.parse('$uri/api/toggle-favourite/$id'),
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
              userProvider.user.copyWith(favourites: jsonDecode(res.body)['favourites']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
     return favouriteList;
  }
 
}