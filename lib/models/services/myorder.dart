import 'dart:convert';

import 'package:beakandbite/models/food.dart';

class Order {
  final String id;
  final List<Food> foods;
  final double totalFoodPrice;
  final String userId;
  final int orderedFoodAt;
  final int status;
  final List<int> quantity;
  final String address;
  final bool cutlery;
  Order({
    required this.id,
    required this.foods,
    required this.totalFoodPrice,
    required this.userId,
    required this.orderedFoodAt,
    required this.status,
    required this.quantity,
    required this.address,
    required this.cutlery,
  });
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'foods': foods.map((x) => x.toMap()).toList()});
    result.addAll({'totalFoodPrice': totalFoodPrice});
    result.addAll({'userId': userId});
    result.addAll({'orderedFoodAt': orderedFoodAt});
    result.addAll({'status': status});
    result.addAll({'quantity': quantity});
    result.addAll({'address': address});
     result.addAll({'cutlery': cutlery});
  
    return result;
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] ?? '',
      foods: List<Food>.from(map['foods']?.map((x) => Food.fromMap(x['food']))),
      totalFoodPrice: map['totalFoodPrice']?.toDouble() ?? 0.0,
      userId: map['userId'] ?? '',
      orderedFoodAt: map['orderedFoodAt']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      quantity: List<int>.from(map['foods']?.map((x) => x['quantity'],
      ),
      ),
      address: map['address'] ?? '', 
      cutlery: map['cutlery'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
