import 'package:beakandbite/common/loader.dart';
import 'package:beakandbite/features/account/widgets/button.dart';
import 'package:beakandbite/features/account/widgets/services/account_services.dart';
import 'package:beakandbite/features/account/widgets/simgle_product.dart';
import 'package:beakandbite/features/admin/services/admin_services.dart';
import 'package:beakandbite/features/myorder_details.dart/screens/my_orderdetailscren.dart';
import 'package:beakandbite/models/services/myorder.dart';
import 'package:flutter/material.dart';

class FoodOrderScreen extends StatefulWidget {
  const FoodOrderScreen({super.key});

  @override
  State<FoodOrderScreen> createState() => _FoodOrderScreenState();
}

class _FoodOrderScreenState extends State<FoodOrderScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
   super.initState();
   fetchOrders();
  }
  void fetchOrders() async {
    orders = await adminServices.fetchUserOrders(context);
    setState(() {});
  }

 
  @override
  Widget build(BuildContext context) {
      return orders == null? const Loader(): Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: GridView.builder(
            itemCount: orders!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 4,
            mainAxisExtent: 200,
          
            ), 
          itemBuilder: (context, index){
            final userOrderData = orders![index];
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, MyOrderDetailsScreen.routeName, arguments: userOrderData);
              },
              child: SizedBox(
               child: SingleProduct(
                  
                  image: userOrderData.foods[0].images[0],
                ),
              
              ),
            );
          }),
          
         
        ),
      );
  }
}