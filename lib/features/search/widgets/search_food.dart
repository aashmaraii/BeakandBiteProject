import 'package:beakandbite/models/food.dart';
import 'package:flutter/material.dart';

class SearchedFood extends StatelessWidget {
  final Food food;
  const SearchedFood({super.key,required this.food});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [Image.network(food.images[0],fit: BoxFit.fitHeight,height: 130,width: 130,)],
        ),
        
      ),
      Column(
        children: [
          Text(food.name),
          Text(food.price.toString(),),
          
        ],
      )
      ],
    );
  }
}