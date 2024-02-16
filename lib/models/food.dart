import 'dart:convert';

class Food {
  final String name;
  final String description;
  final double quantity;
  final List<String>images;
  final String category;
  final double price;
  final String? id;
 
  Food({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    
  });

  Map<String, dynamic> toMap() {
   return{
    'name':name,
    'description':description,
    'quantity':quantity,
    'images':images,
    'category':category,
    'price':price,
    'id':id,
  
   };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
     
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));
}
