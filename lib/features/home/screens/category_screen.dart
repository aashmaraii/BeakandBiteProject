// import 'package:beakandbite/common/loader.dart';
// import 'package:beakandbite/features/home/services/home_services.dart';
// import 'package:beakandbite/models/food.dart';
// import 'package:flutter/material.dart';

// class FoodCategoryScreen extends StatefulWidget {
//   static const String routeName = '/category-items';
//   final String category;

//   const FoodCategoryScreen({super.key,required this.category});

//   @override
//   State<FoodCategoryScreen> createState() => _FoodCategoryScreenState();
// }

// class _FoodCategoryScreenState extends State<FoodCategoryScreen> {
//   List<Food>?foodList;
//   final HomeServices homeServices = HomeServices();
//     @override
//   void initState() {

//     super.initState();
//     fetchCategoryFood();
//   }
//   fetchCategoryFood()async{

//    foodList = await homeServices.fetchCategoriesFood(context: context, category: widget.category);
//    setState(() {
     
//    });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
//         child: Column(
//           children: [
//             Row(
              
//               children: [
//                 Container(
//                   height: 30,
//                   width: 30,
//                   decoration: const BoxDecoration(
//                     color: Colors.green,
//                     shape: BoxShape.circle,
//                   ),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Icon(Icons.arrow_back_ios)),
        
//                 ),
//                 const SizedBox(width:120),
//                 Text(
//                   widget.category,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 24,
//                   ),
//                 )
//               ],
//             ),
//             foodList == null? const Loader(): SizedBox(
//               height: 200,
//               child: GridView.builder(
//                 padding: const EdgeInsets.only(top: 20),
//                 itemCount: foodList!.length,
//                 scrollDirection: Axis.vertical,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1,childAspectRatio: 1.4,mainAxisSpacing: 10), 
//                 itemBuilder: (context,index){
//                   final food = foodList![index];
//                   return Column(
//                     children: [
//                       Container(
//                         height: 180,
//                         decoration: BoxDecoration(
//                           color: Colors.amber,
//                           borderRadius: BorderRadius.circular(10)
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               height: 40,
//                               width: 40,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 ),
//                                 child:  Image.network(food.images[0]),
//                             ),

//                           ],
//                         ),
//                       )
//                     ],
//                   );
//                 })
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }


import 'package:beakandbite/common/loader.dart';
import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/features/home/services/home_services.dart';
import 'package:beakandbite/models/food.dart';
import 'package:flutter/material.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Food>? foodList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    foodList = await homeServices.fetchCategoriesProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: foodList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Keep shopping for ${widget.category}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    // padding: const EdgeInsets.only(bottom: 15),
                    itemCount: foodList!.length,
                    
                    itemBuilder: (context, index) {
                     
                      final food = foodList![index];
                      return GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(
                          //   context,
                          //   ProductDetailScreen.routeName,
                          //   arguments: product,
                          // );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 130,
                            decoration: const BoxDecoration(
                               boxShadow: [
                                    // BoxShadow(
                                    //   color: Color.fromARGB(255, 249, 243, 243),
                                    //   blurRadius: 0.7,
                                    //   spreadRadius: 0.6,
                                    //   offset: Offset(7, 9)
                                    // )
                                  ],
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Color(0xffFFFFFF),
                            ),
                           child: Row(
                                  
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                      // height: 100,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        //shape: BoxShape.circle,
                                       
                                      ),
                                      child: Image.network(food.images[0]),
                                      
                                    ),
                                    //Color.fromARGB(255, 254, 163, 193)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(food.name),
                                        Text(food.price.toString()),
                                      ],
                                    ),
                                    // const Spacer(),
                                    // IconButton(onPressed: (){
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const ManduDescription()));
                          
                                    // }, icon: Icon(favIcon,color: Colors.pink,),),
                                    // //const SizedBox(width: 20,),
                                    
                          
                                    
                                    
                                    
                          
                                  ],
                                ),
                                
                              
                              ),
                        ),
                         
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
