
// import 'package:beakandbite/features/product_description/services/food_rate_services.dart';
// import 'package:beakandbite/models/food.dart';
// // import 'package:beakandbite/provider/user_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // import 'package:provider/provider.dart';

// class ReviewSnackBar extends StatefulWidget {
//     final Food food;
//     final double myRating;
//   const ReviewSnackBar({super.key,required this.food,required this.myRating});
  

//   @override
//   State<ReviewSnackBar> createState() => _ReviewSnackBarState();
// }

// class _ReviewSnackBarState extends State<ReviewSnackBar> {


//    final RateFoodServices rateFoodServices = RateFoodServices();
   
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Rate your Food'),
//       ),
//       body:RatingBar.builder(
//         initialRating: myRating,
//         minRating: 1,
//         direction: Axis.horizontal,
//         allowHalfRating: true,
//         itemBuilder: (context, _)=>
//           const Icon(Icons.star,color: Colors.amber,)
//         , 
//         onRatingUpdate: (rating){
//           rateFoodServices.rateFood(context: context, 
//           food: widget.food, rating: rating);
//         })
      
//     );
    
    
//   }
// }