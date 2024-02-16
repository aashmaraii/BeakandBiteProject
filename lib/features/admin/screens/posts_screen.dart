
// import 'package:beakandbite/common/loader.dart';
import 'package:beakandbite/common/loader.dart';
import 'package:beakandbite/features/account/widgets/simgle_product.dart';
import 'package:beakandbite/features/admin/screens/add_products_screen.dart';
import 'package:beakandbite/features/admin/services/admin_services.dart';
import 'package:beakandbite/models/food.dart';
// import 'package:beakandbite/features/admin/services/admin_services.dart';
// import 'package:beakandbite/models/food.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Food>? foods;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    super.initState();
    fetchAllFoods();
  }

  fetchAllFoods()async{
     foods = await adminServices.fetchAllFoods(context);
     setState(() {
       
     });
  }

  void deleteFood(Food food, int index){
    adminServices.deleteFood(context: context, 
    food: food, onSuccess: (){
     foods!.removeAt(index);
      setState(() {
        
      });
    });
  }

  void navigateToAddFood(){
    Navigator.pushNamed(context, AddFoodScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    //  return Scaffold(
    return foods == null? const Loader(): Scaffold(
      body: GridView.builder(
        itemCount: foods!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,
        itemBuilder: (context,index){
          final foodData = foods![index];
          return Column(
            children: [
              SizedBox(
                height: 140,
                child: SingleProduct(image: foodData.images[0]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Text(
                    foodData.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  ),
                 IconButton(onPressed: (){
                deleteFood(foodData, index);
                 }, icon: const Icon(Icons.delete_outline))

                ],
              )
            ],
          );
        }),
      
      floatingActionButton: FloatingActionButton(
      
        onPressed: navigateToAddFood,
        
        tooltip: 'Add Food',
          child: const Icon(Icons.add),
      ),
      
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  }
}