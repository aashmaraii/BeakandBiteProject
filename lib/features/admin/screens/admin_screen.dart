import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/features/admin/analytics/order_analyticsscreen.dart';
import 'package:beakandbite/features/admin/screens/orders_screen.dart';
import 'package:beakandbite/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}
class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 30;
  double bottomBarBorderWidth = 3;
  List<Widget>pages = [
    const PostsScreen(),
    const FoodOrderScreen(),
    const OrderAnalyticsScreen(), 
  ];
  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Chicken Station Dashboard',style: TextStyle(fontSize: 18),)),
        ),
        body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page, 
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [BottomNavigationBarItem(icon: Container(
          width:bottomBarWidth,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: _page == 0? GlobalVariables.selectedNavBarColor:GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              )
            )
          ),
          child: const Icon(Icons.post_add_sharp),
        ),
        label: '',
        ),
        
        BottomNavigationBarItem(icon: Container(
          width:bottomBarWidth,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: _page == 1? GlobalVariables.selectedNavBarColor:GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              )
            )
          ),
          child: const Icon(Icons.analytics),
        ),
        label: '',
        ),
        //orders
        BottomNavigationBarItem(icon: Container(
          width:bottomBarWidth,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: _page == 2? GlobalVariables.selectedNavBarColor:GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              )
            )
          ),
          child: const Icon(Icons.all_inbox_outlined),
        ),
        label: '',
        ),
        
        ],
      )
      
      ),
    );
  }
}