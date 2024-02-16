import 'dart:io';

// import 'package:beakandbite/common/custom_button.dart';
// import 'package:beakandbite/common/custom_textfield.dart';
import 'package:beakandbite/common/custom_button.dart';
import 'package:beakandbite/common/custom_textfield.dart';
// import 'package:beakandbite/constants/global_variables.dart';
import 'package:beakandbite/constants/utils.dart';
import 'package:beakandbite/features/admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
// import 'package:dotted_border/dotted_border.dart';


class AddFoodScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddFoodScreen({super.key});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  final TextEditingController productNameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
      final TextEditingController priceController = TextEditingController();
        final TextEditingController quantityController = TextEditingController();
        final AdminServices adminServices = AdminServices();
        String category = "Momo";
        List<File> images = [];
        final _addFoodFormKey = GlobalKey<FormState>();
  @override
  void dispose(){
    super.dispose();
    productNameController.dispose();
     descriptionController.dispose();
      priceController.dispose();
       quantityController.dispose();
     }
     List<String> foodCategories = [
      'Momo',
      'Noodles',
      // 'Burger'
      // // 'Pizza',
      // 'Fries'
     ];
     void sellProduct(){
      if(_addFoodFormKey.currentState!.validate() && images.isNotEmpty){
        adminServices.sellProduct(context: context, 
        name: productNameController.text, 
        description: descriptionController.text, 
        price: double.parse(priceController.text), 
        quantity:double.parse(quantityController.text),  
        category: category, 
        images: images);
      }
     }
     void selectImages()async{
      var res = await pickImages();
      setState(() {
        images = res;
      });
     }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child:  Text('Add Food Items',style: TextStyle(
              color: Colors.black,fontSize: 20,
            ),),
          ),
        ),
        
        body: SingleChildScrollView(
          child: Form(
            key: _addFoodFormKey,
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                images.isNotEmpty?CarouselSlider(
      items: images.map((i){
        return Builder(builder: (BuildContext context)=>Image.file(i,fit: BoxFit.cover,height: 200,),
        );

      },
      ).toList(),options:CarouselOptions(
        viewportFraction:1,
        height:200,
      ),

    ):GestureDetector(
                  onTap: selectImages,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [10,4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.folder_open,size: 40,),
                        const SizedBox(height: 15,),
                        Text('Select Food Images',style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade400,
                        ),),  
                      ],
                    ),
                  ),
                  ),
                ),
                const SizedBox(height: 30,),
                CustomTextField(
                  controller: productNameController,
                   hintText: 'Product Name'),
                  //  const SizedBox(height: 10,),
                   CustomTextField(
                  controller: descriptionController,
                   hintText: 'Description',
                  //  maxLines: 20,
                   ),
                    //  const SizedBox(height: 10,),
                   CustomTextField(
                  controller: priceController,
                   hintText: 'Price'),
                    //  const SizedBox(height: 10,),
                   CustomTextField(
                  controller: quantityController,
                   hintText: 'ingredients'),
                   SizedBox(
                    width: double.infinity,
                    child: DropdownButton(value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: foodCategories.map((String item){
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item));
                    }).toList(),
                    onChanged: (String?newVal){
                      setState(() {
                        category = newVal!;
                      });
                    },),
                   ),
                  //  const SizedBox(
                  //   height: 10,
                  //  ),
                   CustomButton(text: 'Sell', 
                   onTap: sellProduct,
                   )
              ],
            ),
          ),
        )
        ),
      ),
    );
  }
}