import 'package:beakandbite/common/loader.dart';
import 'package:beakandbite/features/account/widgets/button.dart';
import 'package:beakandbite/features/account/widgets/services/account_services.dart';
import 'package:beakandbite/features/admin/model/food_sales.dart';
import 'package:beakandbite/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart';

class OrderAnalyticsScreen extends StatefulWidget {
  const OrderAnalyticsScreen({super.key});

  @override
  State<OrderAnalyticsScreen> createState() => _OrderAnalyticsScreenState();
}

class _OrderAnalyticsScreenState extends State<OrderAnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalFoodSales;
  List<FoodSales>? earnings;
  @override
  void initState() {
  
    super.initState();
    getFoodEarnings();
  }
  getFoodEarnings()async{
    var earningDetails = await adminServices.getFoodEarnings(context);
    totalFoodSales = earningDetails['totalOrderEarnings'];
    earnings = earningDetails['foodSales'];
    setState(() {
      
    });


  }
  @override
  Widget build(BuildContext context) {
    return earnings == null || totalFoodSales == null? const Loader(

    ):  Column(
      children: [
        Text('\$$totalFoodSales',
        ),
         AccountButton(
              text: 'Log Out',
              onTap: () => ProfileServices().logOut(context),
            ),
        ],
    );
  }
}