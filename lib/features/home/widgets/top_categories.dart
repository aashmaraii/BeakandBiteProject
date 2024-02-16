
import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/features/home/screens/category_screen.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  void navigateToCategoryPage(BuildContext context, String category){
   Navigator.pushNamed(context, CategoryDealsScreen.routeName,arguments: category);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        itemCount: GlobalVariables.categoryImages.length,
        scrollDirection: Axis.horizontal,
        // itemExtent: 75,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: ()=> navigateToCategoryPage(context,GlobalVariables.categoryImages[index]['title']!),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 80,
                  
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // decoration: const BoxDecoration(
                  //   color: Colors.amber,
                  //   borderRadius: BorderRadius.all(Radius.circular(20))
                    
                  // ),
                  child: Image.asset(GlobalVariables.categoryImages[index]['image']!,
                  fit: BoxFit.cover,
                  
                  ),
                ),
                
                
                 Text(GlobalVariables.categoryImages[index]['title']!,
                 style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                 ),
                 ),
              ]
            ),
          );
        }),
    );
  }
}