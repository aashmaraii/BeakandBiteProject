
// import 'package:beakandbite/common/bottom_bar.dart';
import 'package:beakandbite/common/bottom_bar.dart';
import 'package:beakandbite/features/admin/screens/add_products_screen.dart';
import 'package:beakandbite/features/auth/screens/auth_screens.dart';
import 'package:beakandbite/features/home/screens/category_screen.dart';
import 'package:beakandbite/features/home/screens/home_screen.dart';
import 'package:beakandbite/features/myorder_details.dart/screens/my_orderdetailscren.dart';
import 'package:beakandbite/features/product_description/screens/food_description.dart';
import 'package:beakandbite/features/search/screens/search_screen.dart';
import 'package:beakandbite/models/food.dart';
import 'package:beakandbite/models/services/myorder.dart';
import 'package:beakandbite/try/address.dart';
import 'package:flutter/material.dart';


Route<dynamic>generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>
   const AuthScreen()
   );
   case HomeScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>
   const HomeScreen()
   );
    
   case BottomBar.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>
   const BottomBar(),
   );
   case AddFoodScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>
   const AddFoodScreen(),
   );
   case CategoryDealsScreen.routeName:
   

   var category = routeSettings.arguments as String;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>
   CategoryDealsScreen(
    category:category,
   ),
   );
   case SearchFoodScreen.routeName:
   var searchQuery = routeSettings.arguments as String;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>
   SearchFoodScreen(
    searchQuery:searchQuery,
   ),
   );
    case FoodDescriptionPage.routeName:
    var food = routeSettings.arguments as Food;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>
   FoodDescriptionPage(
    food: food,
   ),
   );
   case UserAddressScreen.routeName:
   var foodAmount = routeSettings.arguments as String;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>
     UserAddressScreen(
foodAmount: foodAmount,

   ),
   );
   case MyOrderDetailsScreen.routeName:
   var myOrder = routeSettings.arguments as Order;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>
     MyOrderDetailsScreen(
      order: myOrder,
   ),
   );
   default:return MaterialPageRoute(
    settings: routeSettings,
    builder:
    (_)=>const Scaffold(
      body: Center(
        child: Text('hsdg'),
      ),
    ));
  }

}