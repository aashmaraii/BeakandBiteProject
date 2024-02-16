
// import 'package:beakandbite/common/bottom_bar.dart';
import 'package:beakandbite/common/bottom_bar.dart';
import 'package:beakandbite/features/admin/screens/add_products_screen.dart';
import 'package:beakandbite/features/auth/screens/auth_screens.dart';
import 'package:beakandbite/features/home/screens/category_screen.dart';
import 'package:beakandbite/features/home/screens/home_screen.dart';
import 'package:beakandbite/features/search/screens/search_screen.dart';
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