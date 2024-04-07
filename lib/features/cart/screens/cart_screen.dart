import 'package:beakandbite/features/cart/screens/widgets/cart_product.dart';
import 'package:beakandbite/features/cart/screens/widgets/cart_subtotal.dart';

import 'package:beakandbite/provider/user_provider.dart';
import 'package:beakandbite/try/address.dart';

import 'package:beakandbite/try/tryservices.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isCutleryNeeded = false;
  //tojson ma pathako wala
  //  userAddressServices.placeFoodOrder(
       
  //       cutlery: cutlery,
  //     );

  void navigateToUserAddress(int sum) {
    Navigator.pushNamed(context, UserAddressScreen.routeName,
        arguments: sum.toString());
  }

  UserAddressServices addressServices = UserAddressServices();
  // CartTotal cartTotal = const CartTotal();
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['food']['price'] as int)
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Basket'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cutlery',
                style: TextStyle(
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
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      'Do you need cutlery?',
                    ),
                    SizedBox(
                      width: 100,
                      child: Switch(
                          value: isCutleryNeeded,
                          onChanged: (bool newValue) {
                            setState(() {
                              isCutleryNeeded = newValue;
                            });
                          }),
                    )
                  ],
                ),
              ),
              const Text(
                'Ordered Foods',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: user.cart.length,
                itemBuilder: (context, index) {
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
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/f.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Specify your order time',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Change',
                            style: TextStyle(
                              color: Colors.pink.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'For Further Enquiry',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                '9812445478',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // {FlutterPhoneDirectCaller.callNumber('+9810589644');},
                              RotatedBox(
                                  quarterTurns: 3,
                                  child: GestureDetector(
                                    onTap: () async {
                                      Future<void> callRestaurant(
                                          String phoneNumber) async {
                                        String phoneNumberWithCountryCode =
                                            phoneNumber;
                                        if (phoneNumber.startsWith('98')) {
                                          phoneNumberWithCountryCode =
                                              "+977$phoneNumber";
                                        }

                                        final Uri phoneLaunchUri = Uri(
                                            scheme: 'tel',
                                            path: phoneNumberWithCountryCode);
                                        if (await canLaunchUrl(
                                            phoneLaunchUri)) {
                                          await launchUrl(phoneLaunchUri);
                                        } else {
                                          throw 'Could not launch $phoneLaunchUri';
                                        }
                                      
                                      }
                                       await callRestaurant("9812445478");
                                    },
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.pink.shade600,
                                    ),
                                  )),
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
              Center(
                child: ElevatedButton(
                    onPressed: () => navigateToUserAddress(sum),
                    // Navigator.push(context, MaterialPageRoute(builder:(context)=> const UserAddressScreen() ));

                    child: const Text('Buy')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
