// import 'package:beakandbite/features/home/widgets/top_categories.dart';
import 'package:beakandbite/features/home/widgets/top_categories.dart';
import 'package:beakandbite/features/search/screens/search_screen.dart';
import 'package:beakandbite/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchFoodScreen.routeName,arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return  SafeArea(
      child:  Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              const Text('Explore,',style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),),
              const Text('Feed your cravings,',style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),),
               const SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(child: SizedBox(
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
                  ),
                 const SizedBox(width: 10,),
                  Container(
                     height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                       color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Icon(Icons.abc), 
                  ),
                  
                  
                ],
              ),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Food Categories'),
                  Text('See more')
                ],
              ),
              const SizedBox(height: 10,),
              const Expanded(child: Categories()),
            ],
          ),
        )
      ),
    );
  }
}