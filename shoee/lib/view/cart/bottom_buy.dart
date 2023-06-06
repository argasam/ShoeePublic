import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/controller/querylogic.dart';
import 'package:shoee/model/cart.dart';
import 'package:shoee/model/custom_const.dart';


class BottomPay extends ConsumerStatefulWidget {
  final List<CartItem> cartList;
  final List<bool> checkedItems;
  const BottomPay({Key? key, required this.cartList, required this.checkedItems}) : super(key:key);
  

  @override
  _BottomPayState createState() => _BottomPayState();
}

class _BottomPayState extends ConsumerState<BottomPay> {


  var queryLogic = QueryLogic();
  List<CartItem> choosenItem = [];
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    updateChoosenItems();
    calculateTotalPrice();
  }

  void updateChoosenItems() {
    choosenItem.clear(); // Clear the choosenItem list before updating

    for (int i = 0; i < widget.checkedItems.length; i++) {
      if (widget.checkedItems[i]) {
        choosenItem.add(widget.cartList[i]);
      }
    }
  }
  void calculateTotalPrice() {
    totalPrice = 0;
    
    for (int i = 0; i < widget.checkedItems.length; i++) {
      if (widget.checkedItems[i]) {
        totalPrice += double.parse(widget.cartList[i].price);
      }
    }
  }
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
          
          Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total: ', style: TextStyle(color: Colors.black),),
                  Text("${totalPrice}")
                ],
              )
            ],)
          ),
          ElevatedButton(
            onPressed: (() {
              
              final buyData = ref.read(buy);
              buyData.setData(totalPrice, choosenItem, widget.cartList);
              context.go('/buypage');
            }),
            style: StyleButton.cartbutton.copyWith(
              fixedSize: MaterialStateProperty.all(Size(
                MediaQuery.of(context).size.width/3, 40))
            ),
            child: Text('Lanjut ke Pembayaran',
            style: TextStyle(color: Colors.white),))

        ]),
    );
  }

  @override
  void didUpdateWidget(covariant BottomPay oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateChoosenItems();
    calculateTotalPrice();
  }
}