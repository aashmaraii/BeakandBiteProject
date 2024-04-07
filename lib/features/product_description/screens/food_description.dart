import 'package:beakandbite/common/custom_app_bar.dart';
import 'package:beakandbite/common/custom_button.dart';
import 'package:beakandbite/common/ratings.dart';
// import 'package:beakandbite/features/product_description/screens/call.dart';
import 'package:beakandbite/features/product_description/services/food_rate_services.dart';
// import 'package:beakandbite/constants/utils.dart';
import 'package:beakandbite/features/search/screens/search_screen.dart';
import 'package:beakandbite/models/food.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FoodDescriptionPage extends StatefulWidget {
  static const String routeName = '/food-details';

  final Food food;
  const FoodDescriptionPage({super.key,required this.food});

  @override
  State<FoodDescriptionPage> createState() => _FoodDescriptionPageState();
}

class _FoodDescriptionPageState extends State<FoodDescriptionPage> {

  final RateFoodServices rateFoodServices = RateFoodServices();


  double averageRating = 0;
  double myRating = 0;
    @override
  void initState() {

    super.initState();
    double totalRating = 0;
    for(int i = 0; i < widget.food.rating!.length; i++){
      totalRating += widget.food.rating![i].rating;
      if (widget.food.rating![i].userId == Provider.of<UserProvider>(context, listen:false).user.id){
        myRating = widget.food.rating![i].rating;
      }
    }
    if(totalRating!=0){
      averageRating = totalRating / widget.food.rating!.length;
    }

  }
  void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchFoodScreen.routeName,arguments: query);
  }

  void addToCart(){
    rateFoodServices.addToCart(context: context, 
    food: widget.food,
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  
                  leftIcon: Icons.arrow_back_ios_new_outlined, 
                  rightIcon: Icons.favorite,
                  rightIconColor: Colors.red,
                  
                  ),
                  Container(
                    height: 250,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                          flex: 1,
                          child: Container(

                        ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                              
                            )
                          ),
                        ))
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            width: 180,
                             height: 180,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              
                            ),
                            child: CarouselSlider(items: 
                            widget.food.images.map((i){
                              return Builder(builder: 
                              (BuildContext context) => Image.network(i,fit: BoxFit.cover,
                              )
                              );
                              
                            }
                            ).toList(), 
                            options: CarouselOptions(
                              viewportFraction: 1,
                              // height: 100,
                            ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                 Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(widget.food.name,style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      ),
                      const SizedBox(height: 10,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        iconRow(Icons.access_time_outlined, Colors.blue, widget.food.price.toString()),
                        iconRow(Icons.production_quantity_limits, Colors.green, widget.food.quantity.toString()),
                      RatingStars(rating:averageRating),
                        // iconRow(Icons.star_outline, Colors.amber, 'later')
                      ],
                     ),
                      const SizedBox(height: 10,),
                     const SizedBox(height: 20,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                          const Text('About',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                         ),),
                           RatingBar.builder(
        initialRating: myRating,
        minRating: 1,
        direction: Axis.horizontal,
        itemCount: 5,
        allowHalfRating: true,
        itemSize: 15,
        // itemPadding: const EdgeInsets.symmetric(horizontal: 6),
        itemBuilder: (context, _)=>
          const Icon(Icons.star,color: Colors.amber,)
        , 
        onRatingUpdate: (rating){
          rateFoodServices.rateFood(context: context, 
          food: widget.food, rating: rating);
        })
                       
                       ],
                     ),
                     const SizedBox(height: 10,),
                     
                     
                  
                         Text(widget.food.description,
                         style: const TextStyle(
                          fontSize: 14,
                    
                         ),
                         ),
                       
                     
                     const SizedBox(height: 60,),
                    Container(
                      
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                         color: Colors.amber.shade300,
                      ),
                      child: CustomButton(text: 'Basket', 
                      onTap: addToCart,
                      // onTap: addToCart,
                      ),
                      
                    ),
                  
                    
                    ],
                  ),
                 ),
                 Container(
                  height: 100,
                  color: Colors.white,
                 )

              ],
            ),
          ),
        )
      ),
    );
  }
  Widget iconRow(
    IconData icon, Color color, String text
  ){
    return Row(
      children: [
        Icon(icon,
        color: color,
        size: 20,
        ),
        Text(text,style: const TextStyle(fontSize: 16),)
      ],
    );
  }
}