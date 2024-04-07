
// import 'package:beakandbite/common/loader.dart';
// import 'package:beakandbite/features/home/services/home_services.dart';
// import 'package:beakandbite/features/product_description/screens/food_description.dart';
// import 'package:beakandbite/models/food.dart';
// import 'package:flutter/material.dart';

// class FoodForYou extends StatefulWidget {
//   const FoodForYou({Key? key}) : super(key: key);

//   @override
//   State<FoodForYou> createState() => _FoodForYouState();
// }

// class _FoodForYouState extends State<FoodForYou> {
//   Food? food;
//   final HomeServices homeServices = HomeServices();

//   @override
//   void initState() {
//     super.initState();
//     foodForYou();
//   }

//   void foodForYou() async {
//     food = await homeServices.foodForYou(context: context);
//     setState(() {});
//   }

//   void navigateToDetailScreen() {
//     Navigator.pushNamed(
//       context,
//       FoodDescriptionPage.routeName,
//       arguments: food,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return food == null
//         ? const Loader()
//         : food!.name.isEmpty
//             ? const SizedBox()
//             : GestureDetector(
//                 onTap: navigateToDetailScreen,
//                 child: Column(
//                   children: [
//                     Container(
//                       alignment: Alignment.topLeft,
//                       padding: const EdgeInsets.only(left: 10),
//                       child: const Text(
//                         'Food for you',
                      
//                       ),
//                     ),
//                     Image.network(
//                       food!.images[0],
//                       height: 100,
//                       fit: BoxFit.fitHeight,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.only(left: 15),
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                        food!.price.toString(),
//                         style:  const TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     // Container(
//                     //   alignment: Alignment.topLeft,
//                     //   padding:
//                     //       const EdgeInsets.only(left: 15, top: 5, right: 40),
//                     //   child: const Text(
//                     //     'Rivaan',
//                     //     maxLines: 2,
//                     //     overflow: TextOverflow.ellipsis,
//                     //   ),
//                     // ),
//                     // SingleChildScrollView(
//                     //   scrollDirection: Axis.horizontal,
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //     children: food!.images
//                     //         .map(
//                     //           (e) => Image.network(
//                     //             e,
//                     //             fit: BoxFit.fitWidth,
//                     //             width: 100,
//                     //             height: 100,
//                     //           ),
//                     //         )
//                     //         .toList(),
//                     //   ),
//                     // ),
//                     // Container(
//                     //   padding: const EdgeInsets.symmetric(
//                     //     vertical: 15,
//                     //   ).copyWith(left: 15),
//                     //   alignment: Alignment.topLeft,
//                     //   child: Text(
//                     //     'See all deals',
//                     //     style: TextStyle(
//                     //       color: Colors.cyan[800],
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               );
//   }
// }


import 'package:beakandbite/common/loader.dart';
import 'package:beakandbite/features/home/services/home_services.dart';
import 'package:beakandbite/features/product_description/screens/food_description.dart';
import 'package:beakandbite/models/food.dart';
import 'package:flutter/material.dart';

class FoodForYou extends StatefulWidget {
  const FoodForYou({Key? key}) : super(key: key);

  @override
  State<FoodForYou> createState() => _FoodForYouState();
}

class _FoodForYouState extends State<FoodForYou> {
  Food? food;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    foodForYou();
  }

  void foodForYou() async {
    // food = await homeServices.foodForYou(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      FoodDescriptionPage.routeName,
      arguments: food,
    );
  }

  @override
  Widget build(BuildContext context) {
    return food == null
        ? const Loader()
        : food!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailScreen,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Food of the Day',
                    
                    ),
                    const SizedBox(height: 10,),
                   Container(
  width: 180,
  height: 130,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    image: DecorationImage(
      image: NetworkImage(food!.images[0]), // Use NetworkImage to fetch the image
      fit: BoxFit.fill, // Adjust the fit as per your requirement
    ),
  ),
),
Text(food!.name),
Text(food!.price.toString()),
                  ],
                ),
              );
  }
}

// import 'package:beakandbite/common/loader.dart';
// import 'package:beakandbite/features/home/services/home_services.dart';
// import 'package:beakandbite/features/product_description/screens/food_description.dart';
// import 'package:beakandbite/models/food.dart';
// import 'package:flutter/material.dart';

// class FoodForYou extends StatefulWidget {
//   const FoodForYou({Key? key}) : super(key: key);

//   @override
//   State<FoodForYou> createState() => _FoodForYouState();
// }

// class _FoodForYouState extends State<FoodForYou> {
//   List<Food> foods = [];
//   final HomeServices homeServices = HomeServices();

//   @override
//   void initState() {
//     super.initState();
//     fetchFoodForYou();
//   }

//   void fetchFoodForYou() async {
//     List<Food> fetchedFoods = await homeServices.foodForYou(context: context);
//     setState(() {
//       foods = fetchedFoods;
//     });
//   }

//   void navigateToDetailScreen(Food food) {
//     Navigator.pushNamed(
//       context,
//       FoodDescriptionPage.routeName,
//       arguments: food,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return foods.isEmpty
//         ? const Loader()
//         : Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: const EdgeInsets.only(left: 10),
//                 child: const Text(
//                   'Foods for you',
//                 ),
//               ),
//               SizedBox(
//                 height: 120,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: foods.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return GestureDetector(
//                       onTap: () => navigateToDetailScreen(foods[index]),
//                       child: Container(
//                         margin: const EdgeInsets.all(10),
//                         child: Column(
//                           children: [
//                             Image.network(
//                               foods[index].images[0],
//                               height: 80,
//                               width: 80,
//                               fit: BoxFit.cover,
//                             ),
//                             Text(
//                               foods[index].price.toString(),
//                               style: const TextStyle(fontSize: 16),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//   }
// }
