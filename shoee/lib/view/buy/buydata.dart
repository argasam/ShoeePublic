import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoee/model/cart.dart';

final buyDataProvider = Provider<BuyData>((ref) => BuyData());

class BuyData {
  double price = 0.0;
  List<CartItem> choosenItems = [];
  List<CartItem> cartList = [];

  void setData(double totalPrice, List<CartItem> items, List<CartItem> cart) {
    price = totalPrice;
    choosenItems = items;
    cartList = cart;
  }
}