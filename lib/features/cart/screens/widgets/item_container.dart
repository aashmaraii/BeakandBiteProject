import 'package:flutter/material.dart';

class ItemContainer extends StatefulWidget {
  const ItemContainer({super.key});

  @override
  State<ItemContainer> createState() => _ItemContainerState();
}
class _ItemContainerState extends State<ItemContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.only(top: 10,bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text('Do you need cutlery?',
                    ),
                    SizedBox(
                      width: 100,
                      child: Switch(value: false, onChanged: (bool?newValue){

                      }),
                    ) 
                  ],
                ),
              );
  }
}