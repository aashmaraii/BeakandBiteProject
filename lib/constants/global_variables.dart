import 'package:flutter/material.dart';

// String uri = 'http://100.64.197.4:3000';
// String uri = 'http://192.168.1.65:3000';
// String uri = 'http://100.64.212.193:3000';
// String uri = 'http://100.64.212.193:3000';

String uri = 'http://192.168.18.14:3000';

// String uri = 'http://27.34.65.45/32:3000 ';

class GlobalVariables{
   static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static var backgroundColor = Colors.grey[300]!;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Momo',
      'image': 'assets/images/a.jpeg',
    },
    {
      'title': 'Noodles',
      'image': 'assets/images/b.jpeg', 
    },
    {
      'title': 'Burger',
      'image': 'assets/images/c.jpeg',
    },
    {
      'title': 'Pizza',
      'image': 'assets/images/d.png',
    },
    {
      'title': 'Fries',
      'image': 'assets/images/e.jpeg',
    },
    {
      'title': 'Cutlet',
      'image': 'assets/images/g.jpeg',
    },
  ];
}