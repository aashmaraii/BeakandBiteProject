// import 'dart:convert';

// class User {
//   final String id;
//   final String name;
//   final String email;
//   final String password;
//   final String address;
//   final String type;
//   final String token;
//   final List<dynamic> cart;
//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.address,
//     required this.type,
//     required this.token,
//     required this.cart,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};
  
//     result.addAll({'id': id});
//     result.addAll({'name': name});
//     result.addAll({'email': email});
//     result.addAll({'password': password});
//     result.addAll({'address': address});
//     result.addAll({'type': type});
//     result.addAll({'token': token});
//     result.addAll({'cart': cart});
  
//     return result;
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       id: map['id'] ?? '',
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       password: map['password'] ?? '',
//       address: map['address'] ?? '',
//       type: map['type'] ?? '',
//       token: map['token'] ?? '',
//       cart: List<Map<String,dynamic>>.from(map['cart']?.map((x)=>Map<String,dynamic>.from(x),),),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) => User.fromMap(json.decode(source));

//   User copyWith({
//     String? id,
//     String? name,
//     String? email,
//     String? password,
//     String? address,
//     String? type,
//     String? token,
//     List<dynamic>? cart,
//   }) {
//     return User(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       password: password ?? this.password,
//       address: address ?? this.address,
//       type: type ?? this.type,
//       token: token ?? this.token,
//       cart: cart ?? this.cart,
//     );
//   }
// }

import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;
  final List<dynamic> cart;
  final List<dynamic> favourites;
  final bool isCutleryNeeded;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
    required this.cart,
    required this.favourites,
    this.isCutleryNeeded = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'cart': cart,
      'favourites': favourites,
      'isCutleryNeeded': isCutleryNeeded,
      
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
      cart: List<Map<String, dynamic>>.from(
        map['cart']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
       favourites: List<Map<String, dynamic>>.from(
        map['favourites']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
      isCutleryNeeded: map['isCutleryNeeded'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
    List<dynamic>? cart,
    List<dynamic>? favourites,
    bool? isCutleryNeeded,
    
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
      favourites: favourites ?? this.favourites,
      isCutleryNeeded: isCutleryNeeded ?? this.isCutleryNeeded,
      
    );
  }
}

