import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 30;
  double bottomBarBorderWidth = 3;

  List<Widget>pages = [
    const HomeScreen(),
    const Center(
      child: Text('Cart Page'), 
    ),
     const Center(
      child: Text('Favourite Page'),
    ),
     const Center(
      child: Text('Account Page'),
    ),
  ];
  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: const Icon(Icons.home_outlined),
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
          child: badges.Badge(
            
            badgeContent: const Text('2'),
            badgeStyle: badges.BadgeStyle(
              elevation: 0,
              shape: badges.BadgeShape.circle,
              badgeColor: Colors.pink.shade300,
            ),
            child: const Icon(Icons.shopping_basket_outlined)),
        ),
        label: '',
        ),
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
          child: const Icon(Icons.favorite),
        ),
        label: '',
        ),
        BottomNavigationBarItem(icon: Container(
          width:bottomBarWidth,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: _page == 3? GlobalVariables.selectedNavBarColor:GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              )
            )
          ),
          child: const Icon(Icons.person),
        ),
        label: '',
        ),
        
        ],
      )
      
    );
  }
}