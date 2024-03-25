import 'package:beakandbite/common/button.dart';
import 'package:beakandbite/features/cart/screens/widgets/cart_product.dart';
import 'package:beakandbite/features/cart/screens/widgets/cart_subtotal.dart';
// import 'package:beakandbite/features/product_description/screens/call.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    // int sum = 0;
    // user.cart
    //     .map((e) => sum += e['quantity'] * e['product']['price'] as int)
    //     .toList();
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Basket'),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Cutlery',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.only(top: 10,bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text('Do you need cutlery?',
                    ),
                    SizedBox(
                      width: 100,
                      child: Switch(value: false, onChanged: (bool?newValue){

                      }),
                    )
                    
                  ],
                ),
              ),
              const Text('Ordered Foods',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: user.cart.length,
                itemBuilder: (context,index){
                  return CartFood(index: index);
                },
                ),
                 Container(
                    height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.only(top: 10,bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    const Image(image: AssetImage('assets/images/f.png'),
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 20),
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Text('Specify your order time',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Change',style: TextStyle(
                          color: Colors.pink.shade600,
                          fontWeight: FontWeight.bold,
                        ),),
                        ],
                       ),
                     )
                    
                     
                  
                    
                  ],
                ),
              ),
                  Container(
                    height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.only(top: 10,bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                       child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                            const Text('For Further Enquiry',
                           style: TextStyle(fontWeight: FontWeight.bold,
                           fontSize: 16,
                           ),
                                               ),
                            Row(
                              children: [
                                const Text('+977 9810589644',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                                TextButton(onPressed: ()
                                        {FlutterPhoneDirectCaller.callNumber('+9810589644');}, 
                                        child: RotatedBox(
                                          quarterTurns: 3,
                                          child: Icon(Icons.call,color: Colors.pink.shade600,)),
                                        
                                        ),
                              ],
                            ),
                                             
                         ],
                       ),
                     ),
                    
                     const Image(image: AssetImage('assets/images/f.png'))
                  
                    
                  ],
                ),
              ),
                const CartTotal(),
               const Center(child: MyButton()),
            ],
          ),
        ),
      ),
    );
  }
}