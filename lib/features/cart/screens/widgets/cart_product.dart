import 'package:beakandbite/features/cart/services/cart_services.dart';
// import 'package:beakandbite/features/product_description/screens/food_description.dart';
import 'package:beakandbite/features/product_description/services/food_rate_services.dart';
import 'package:beakandbite/models/food.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartFood extends StatefulWidget {
  final int index;
  const CartFood({super.key,required this.index});

  @override
  State<CartFood> createState() => _CartFoodState();
}
class _CartFoodState extends State<CartFood> {
  final RateFoodServices rateFoodServices = RateFoodServices();
  final CartServices cartServices = CartServices();

  void increaseQuantity(Food food){
    rateFoodServices.addToCart(context: context, food: food);
  }

    void decreaseQuantity(Food food){
    cartServices.removeFromCart(context: context, food: food);
  }
  @override
  Widget build(BuildContext context) {
    final foodCart = context.watch<UserProvider>().user.cart[widget.index];
    final food = Food.fromMap(foodCart['food']);
    final quantity = foodCart['quantity'];
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
                  children: [
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        food.images[0],
                        // fit: BoxFit.contain,
                        // height: 135,
                        // width: 135,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        Text(
                          food.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          maxLines: 2,
                        ),
                        Text(
                          'Rs${food.price}',
                          style: const TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),  
                      ],
                    ),  
                  ],
                ),
                Container(
                  
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.pink.shade600,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => decreaseQuantity(food),
                        child: const Icon(Icons.remove,color: Colors.white,)),
                      Container(
                        height: 20,
                        width: 40,
                         alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Text(quantity.toString(),),
                      ),
                       InkWell(
                        onTap: () => increaseQuantity(food),
                        child: const Icon(Icons.add,
                      color: Colors.white,)),
                      
                    ],
                  ),
                  
                ),
        ],
      ),
    );
          
          
          
        
  }
}