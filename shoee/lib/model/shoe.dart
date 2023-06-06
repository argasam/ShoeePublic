import 'package:flutter/material.dart';
// import 'package:shoee/model/sex.dart';
// import 'package:shoee/model/shoe_type.dart';

// class Shoe {
//   final String name, description, image, brand;
//   double rating;
//   final int id,price;
//   final Shoe_Type tipe;
//   final Sex sex;
//   final Color color;
//   Shoe ({
//     this.id = 0,
//     this.image = 'a',
//     this.brand = 'a',
//     this.name = 'a',
//     this.price = 0,
//     this.description = 'a',
//     this.rating = 0.0,
//     this.tipe = Shoe_Type.Boots,
//     this.sex = Sex.Mens
//     this.size,
//     this.color
//   });
// }

// List<Shoe> shoes = [
//   Shoe(
//     id: 1,
//     brand: "Brodoo",
//     name:  "Campo Heritage 1",
//     price: 375000,
//     description: dummyText,
//     image:"assets/images/sepatu_hitam.png",
//     rating: 3.0,
//     tipe: Shoe_Type.Boots,
//     sex: Sex.Mens
//     color: Colors.black,
//     ),
//   Shoe(
//     id: 2,
//     brand: "Brodoo",
//     name:  "Campo Heritage 2",
//     price: 375000,
//     description: dummyText,
//     image:"assets/images/sepatu_putih.png",
//     rating: 5.0,
//     sex: Sex.Mens
//     color: Colors.black,
//     ),
  
// ];


// String dummyText =
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

class Shoe{
  final String name, brand, image, sex, type, description, id;
  final int price, rating;

  Shoe({
    required this.id,
    required this.name, 
    required this.brand, 
    required this.image, 
    required this.sex, 
    required this.type, 
    required this.description, 
    required this.price, 
    required this.rating});

}