
import 'package:beakandbite/common/loader.dart';
import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/features/account/widgets/services/account_services.dart';
import 'package:beakandbite/features/account/widgets/simgle_product.dart';
import 'package:beakandbite/features/myorder_details.dart/screens/my_orderdetailscren.dart';
import 'package:beakandbite/models/services/myorder.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<Order>? orders;
  final ProfileServices accountServices = ProfileServices();

  @override
  void initState() {
    super.initState();
    viewMyOrders();
  }

  void viewMyOrders() async {
    orders = await accountServices.viewMyOrders(context: context);
    setState(() {});
  }

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Your App Title'),
    ),
    body: orders == null
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: const Text(
                      'My Food Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: GlobalVariables.selectedNavBarColor,
                      ),
                    ),
                  ),
                ],
              ),
              // display MyOrders
              Container(
                height: 170,
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                  right: 0,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, MyOrderDetailsScreen.routeName,arguments: orders![index]);
                      },
                      child: SingleProduct(image: orders![index].foods[0].images[0]));
                    // return GestureDetector(
                    //   onTap: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       OrderDetailScreen.routeName,
                    //       arguments: MyOrders![index],
                    //     );
                    //   },
                    //   child: SingleProduct(
                    //     image: MyOrders![index].products[0].images[0],
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
  );
}

}
