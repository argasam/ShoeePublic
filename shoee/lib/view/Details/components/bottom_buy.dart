import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/controller/querylogic.dart';
import 'package:shoee/model/shoe.dart';

class BottomBuy extends StatefulWidget {
  final Shoe shoe;
  
  final String uid, color, size, image;

  const BottomBuy({super.key, required this.shoe, required this.uid, required this.color, required this.size, required this.image});

  @override
  State<BottomBuy> createState() => _BottomBuyState();
}

class _BottomBuyState extends State<BottomBuy> {
  var queryLogic = QueryLogic();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        
        boxShadow: [
          BoxShadow(
          color: Colors.grey.withOpacity(0.5), // Shadow color
          spreadRadius: 2, // Spread radius
          blurRadius: 5, // Blur radius
          offset: Offset(0, 3), // Offset in x and y directions
        ),]
      ),
      
      
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        children: [
          
          ElevatedButton(
          
            onPressed: () {
              
              
            }, 
            style: StyleButton.buybutton.copyWith(
              fixedSize: MaterialStateProperty.all(Size(
                MediaQuery.of(context).size.width/3, 40))
            ),
            child: Text('Beli Sekarang',
            style: TextStyle(color: Color.fromRGBO(101, 99, 255, 1.0)),),),
          ElevatedButton(
            onPressed: (() {
              queryLogic.addtocart(widget.shoe, widget.uid, widget.color, widget.size, widget.image);
            }),
            style: StyleButton.cartbutton.copyWith(
              fixedSize: MaterialStateProperty.all(Size(
                MediaQuery.of(context).size.width/3, 40))
            ),
            child: Text('+ Keranjang',
            style: TextStyle(color: Colors.white),))

        ]),
    );
  }
}