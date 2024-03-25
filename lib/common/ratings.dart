// import 'package:beakandbite/features/product_description/services/food_rate_services.dart';
// import 'package:beakandbite/models/ratings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  const RatingStars({super.key,required this.rating});

  //  final RateFoodServices rateFoodServices = RateFoodServices();
  @override
   Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      rating: rating,
      itemSize: 15,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }
}