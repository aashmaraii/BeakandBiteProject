// import 'package:flutter/cupertino.dart';
import 'package:beakandbite/common/custom_button.dart';
import 'package:beakandbite/features/admin/services/admin_services.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:beakandbite/models/services/myorder.dart';
import 'package:provider/provider.dart';

class MyOrderDetailsScreen extends StatefulWidget {
  static const String routeName = '/my-orderdetails';

  final Order order;
  const MyOrderDetailsScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<MyOrderDetailsScreen> createState() => _MyOrderDetailsScreenState();
}


class _MyOrderDetailsScreenState extends State<MyOrderDetailsScreen> {
  int currentStep = 0;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    super.initState();
    currentStep = widget.order.status;
    
  }
  void changeFoodOrderStatus(int status){
    adminServices.changeFoodOrderStatus(context: context, 
    
    onSuccess: (){
      setState(() {
        currentStep += 1;
        
        
      });
    },
    order: widget.order, status: status + 1);

  }
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Order Details',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  height: 80,
                  
                  decoration: const BoxDecoration(
                    
                    color: Colors.white38,
                    // borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Text(
                      //   // 'Order Date: ${widget.order.orderedFoodAt}',
                      // ),
                      Text('Total Price: ${widget.order.totalFoodPrice}',style:const TextStyle(fontSize: 14,),),
                      Text('Date Ordered: ${DateFormat().format(DateTime.fromMillisecondsSinceEpoch(widget.order.orderedFoodAt,),)}',style: const TextStyle(fontSize: 14),),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(' Food Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                const SizedBox(height: 10,),
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                  ),
                  
                  // height: 10,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < widget.order.foods.length; i++)
                      
                      Row(
                        children: [
                            
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,
                          ),
                          child: Column(
                            
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.order.foods[i].name,
                              ),
                              Text(
                                'Quantity: ${widget.order.quantity[i]}',
                          ),],
                          ),
                        ),
                          Image.network(widget.order.foods[i].images[0],
                          height: 80,
                                                
                          fit: BoxFit.cover,
                                                
                          ),
                          
                        ],
                        
          
                      ),
                      const Text('Track your Orders'),
                      Stepper(
                        currentStep: currentStep,
                        controlsBuilder: (context, details){
                          if(user.type == 'admin'){
                            return CustomButton(text: 'Done',
                             onTap: () => changeFoodOrderStatus(details.currentStep));
                          }
                          return const SizedBox();
                        },
                        steps:  [
                        Step(title: const Text('Pending'), 
                      
                        content: const Text('Your food order is yet to be delivered',
                        ),
                        isActive: currentStep > 0,
                        state: currentStep > 0 ? StepState.complete: StepState.indexed,
                      
                        ),
                         Step(title: const Text('Completed'), 
                        content: const Text('Your food been completed',
                        ),
                        isActive: currentStep > 1,
                         state: currentStep > 1 ? StepState.complete: StepState.indexed,
                        ),
                        
                         Step(title: const Text('Received'), 
                        content: const Text('Your food order has been delivered',
                        ),
                        isActive: currentStep >= 2,
                        state: currentStep >= 2 ? StepState.complete: StepState.indexed,
                        ),
                         Step(title: const Text('Delivered'), 
                        content: const Text('Your food order has been delivered',
                        ),
                        isActive: currentStep >= 3,
                        state: currentStep >= 3 ? StepState.complete: StepState.indexed,
                        ),
                        
                      ],
                      )
                    ],
                  ),
                )
          
              ],
            ),
        ),
      ),

      
    );
  }
}