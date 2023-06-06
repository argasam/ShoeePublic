// lib/view/cart_view.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/controller/querylogic.dart';
import 'package:shoee/model/cart.dart';


import 'package:shoee/model/shoesize.dart';

import 'package:shoee/view/bottom_navigation_bar_widget.dart';
import 'package:shoee/view/cart/bottom_buy.dart';



class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key:key);
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  
  final _db = FirebaseFirestore.instance;
  List<CartItem> cartList = [];
  
  
  @override
  void initState() {
    super.initState();
    var queryLogic = QueryLogic();
     
    queryLogic.loadcart(auth.currentUser?.uid ?? '').then((list) {
      setState(() {
        cartList = list;
         // Update the shoe list state variable with the fetched list
      });
    
    });
    
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text('Keranjang', style: TextStyle(
        color: Colors.black,
        fontSize: 18
      ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // implement GridView.builder
        child: Container(
          margin: EdgeInsets.all(kDefaultPaddin),
          child: ListView.builder(
            itemCount: cartList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              final currentCart = cartList [index];
              return Container(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Image.network(currentCart.color)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        
                        Text(currentCart.name),
                        Text(currentCart.size.toString()),
                        Text(currentCart.price)

                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Text(currentCart.quantity.toString()),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
          )
        )
        // ListView.builder(
        //   itemBuilder: ((context, index) {
            
        //   }))
     
      ),
      bottomNavigationBar: BottomPay(cartList: cartList), 
    );
  }
  
}
