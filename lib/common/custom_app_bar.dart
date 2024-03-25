// import 'package:beakandbite/features/favourites/services/favorites_service.dart';
// import 'package:beakandbite/models/food.dart';
// import 'package:beakandbite/models/user.dart';
// import 'package:beakandbite/provider/user_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CustomAppBar extends StatefulWidget {
//   final IconData leftIcon;
//   final IconData rightIcon;
//   const CustomAppBar({super.key,required this.leftIcon,required this.rightIcon});

//   @override
//   State<CustomAppBar> createState() => _CustomAppBarState();
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   final FavouriteServices favouriteServices = FavouriteServices();

//   Future<List<Food>> handleFavourites(String id){
//     return favouriteServices.handleFavourites(context: context, id: id);
//   }
//   @override
//   Widget build(BuildContext context) {
//     final foodFavourites = context.watch<UserProvider>().user.favourites;
//     final food = User.fromMap(foodFavourites['favourites']);
//     return Container(
//       padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,
//       left: 25,right: 25),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: (){
//               Navigator.pop(context);
//             },
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//               child: Icon(widget.leftIcon),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//             ),
//             child: InkWell(
//               onTap: ()=> handleFavourites(food),
//               child: Icon(widget.rightIcon)),
//           )
//         ],
//       ),
    
//     );
//   }
// }

import 'package:beakandbite/features/favourites/services/favorites_service.dart';
import 'package:beakandbite/models/food.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final IconData leftIcon;
  final IconData rightIcon;

  const CustomAppBar({Key? key, required this.leftIcon, required this.rightIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavouriteServices favouriteServices = FavouriteServices();

    Future<void> handleFavourites(String id) async {
      await favouriteServices.handleFavourites(context: context, id: id);
    }

    final foodFavourites = context.watch<UserProvider>().user.favourites;
    final foodList = foodFavourites as List<dynamic>; // Assuming favourites is a list

    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(leftIcon),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: GestureDetector(
              
              onTap: () {
                
                handleFavourites('65e31bffa3f0b57ad69000b1');
                print('print');
              },
              
              child: Icon(rightIcon),
              
              
            ),
          )
        ],
      ),
    );
  }
}
