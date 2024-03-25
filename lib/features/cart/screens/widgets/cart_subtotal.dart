// // import 'package:beakandbite/provider/user_provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // class CartTotal extends StatelessWidget {
// //   const CartTotal({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final user = context.watch<UserProvider>().user;
// //     int sum = 0;
// //       user.cart.map((e)=>sum+=e['quantity']*e['food']['price']as int).toList();
// //     return SafeArea(
// //       child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //             const Text('Total',style: TextStyle(
// //               fontWeight: FontWeight.bold,
// //               fontSize: 20,
// //             ),
// //             ),

// //             Text('Rs$sum',style:  const TextStyle(
// //               fontWeight: FontWeight.bold,
// //               fontSize: 20,
// //             ),
// //             ),
// //           ],
// //         ),
// //     );
// //   }
// // }


// import 'package:beakandbite/provider/user_provider.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart.map((e) => sum+=e['quantity']*e['food']['price'] as int).toList();
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Subtotal ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'Rs$sum',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
