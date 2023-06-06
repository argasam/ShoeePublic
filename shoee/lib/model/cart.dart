import 'package:flutter/material.dart';

class CartItem {

  final String name;
  final String brand;
  final String color;
  final String price;
  final int quantity;
  final int size;
  final String image;
  
  CartItem({
    required this.name,
    required this.brand,
    required this.color,
    required this.price,
    required this.quantity,
    required this.size,
    required this.image
  });
}