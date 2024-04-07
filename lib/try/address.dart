
import 'package:beakandbite/common/custom_textfield.dart';
import 'package:beakandbite/constants/utils.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:beakandbite/try/tryservices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserAddressScreen extends StatefulWidget {
  static const String routeName = '/userAddress';

  final String foodAmount;
  const UserAddressScreen({
    Key? key,
    required this.foodAmount,
    
  
  }) : super(key: key);

  @override
  State<UserAddressScreen> createState() => _UserAddressScreenState();
}

class _UserAddressScreenState extends State<UserAddressScreen> {
  final TextEditingController homeController = TextEditingController();
  final TextEditingController townController = TextEditingController();
  final _userAddressFormKey = GlobalKey<FormState>();
  String userAddedAddress = "";
   bool cutlery = false;

  final UserAddressServices userAddressServices = UserAddressServices();

  @override
  void dispose() {
    super.dispose();
    homeController.dispose();
    townController.dispose();
  }



  void placeOrder() {
    if (_userAddressFormKey.currentState!.validate()) {
      // If form is valid, collect address details
      final String address =
          '${homeController.text}, ${townController.text}';
      // final cutlery = cutlery;
      // Call service method to place food order
      userAddressServices.placeFoodOrder(
        context: context,
        foodOrderSum: double.parse(widget.foodAmount),
        address: address,
        cutlery: cutlery,
      );
    } else {
      // Form is not valid, show error message
      showSnackBar(context, 'Please enter all the values!');
    }
  }

  @override
  Widget build(BuildContext context) {
    var userAddress = context.watch<UserProvider>().user.address;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User Address'),
      ),
      body: Column(
        children: [
          if (userAddress.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  const Text('Deliver Food To'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(
                      userAddress,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          Form(
            key: _userAddressFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Home Address',
                    controller: homeController,
                  ),
                  const SizedBox(height: 10,),
                  CustomTextField(
                    hintText: 'Town',
                    controller: townController,
                  ),
                  SwitchListTile(value: cutlery, onChanged: (value){
                    setState(() {
                      cutlery = value;
                    });
                  }),
                  
                  const SizedBox(height: 10,),
                  MaterialButton(
                    onPressed: placeOrder, // Call placeOrder method
                    child: const Text('Place Order'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}