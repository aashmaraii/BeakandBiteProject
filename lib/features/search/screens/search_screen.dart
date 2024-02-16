import 'package:beakandbite/common/loader.dart';
import 'package:beakandbite/features/search/services/search_services.dart';
import 'package:beakandbite/features/search/widgets/search_food.dart';
import 'package:beakandbite/models/food.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SearchFoodScreen extends StatefulWidget {

  static const String routeName = '/search-food';
  final String searchQuery;
  const SearchFoodScreen({super.key,required this.searchQuery});


  State<SearchFoodScreen> createState() => _SearchFoodScreenState();
}

class _SearchFoodScreenState extends State<SearchFoodScreen> {
  List<Food>? foods;
  final SearchServices searchServices = SearchServices();
  @override
  void initState() {
    
    super.initState();
    fetchFood();
  }
  fetchFood()async{
    foods = await searchServices.fetchFood(context: context, searchQuery: widget.searchQuery);
    setState(() {
      
    });
  }
   void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchFoodScreen.routeName,arguments: query);
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [ Expanded(child: SizedBox(
                    height: 40,
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchScreen,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {
                              
                            },
                            child: const Padding(padding:EdgeInsets.only(left: 5,

                            ),
                            child: Icon(Icons.search, color: Colors.black,size: 23,),
                             ),
                          ),
                          filled: true,
                          
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7),
                            ),
                            borderSide: BorderSide(color: Colors.black38,width: 1),
                          ),
                          hintText: 'Search food',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,fontSize: 15,
                          )
                        ),
                      ),
                    ),
                  ),
                  ),],
        ),
      ),
      
      body: foods == null? const Loader():Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: foods!.length,
            itemBuilder: (context,index){
              return SearchedFood(food: foods![index]);
            },
            ),
            ),
            
        ],
      )
    );
  }
}