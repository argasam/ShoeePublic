// lib/view/custom_view.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/controller/querylogic.dart';
import 'package:shoee/model/cart.dart';

import 'package:shoee/view/acc_view.dart';

import 'package:shoee/view/bottom_navigation_bar_widget.dart';
import 'package:get/get.dart';
import 'package:shoee/view/cart_view.dart';
import 'package:shoee/view/home_view.dart';

class CustomView extends StatefulWidget {
  @override
  _CustomViewState createState() => _CustomViewState();
}

class _CustomViewState extends State<CustomView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  
  final _db = FirebaseFirestore.instance;
  List<CartItem> cartList = [];
  List<bool> checkedItems = [];
  
  @override
  void initState() {
    super.initState();
    var queryLogic = QueryLogic();
     
    queryLogic.loadcart(auth.currentUser?.uid ?? '').then((list) {
      setState(() {
        cartList = list;
        checkedItems = List<bool>.filled(cartList.length, false); // Update the shoe list state variable with the fetched list
      });
    
    });
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          
          IconButton(
          onPressed: (() {
            context.push('/customhistory');
            
          }) ,
          icon: Icon(Icons.history),
          color: Color.fromRGBO(101, 99, 255, 1.0) ),
        ],
        
          
        title: Text('Pilih Jenis Kustomiasi',
        style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          
          margin: EdgeInsets.symmetric(horizontal: kDefaultPaddin+30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( 
                width: MediaQuery.of(context).size.width, height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)),
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/shoee-3c816.appspot.com/o/View%2Fimage%2017.png?alt=media&token=9a4a72a4-1604-4e2a-97e1-58d423c40048",
                  fit: BoxFit.contain,),),
              Container(
                width: MediaQuery.of(context).size.width, height: 150,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                    right: BorderSide(width: 1, color: Colors.grey),
                    left: BorderSide(width: 1, color: Colors.grey) )),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin/2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text('Template Sepatu',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            SizedBox(height: 10,),
                            Text('Kustomisasi Sepatu dari Template yang Telah Kami Sediakan',
                            style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  alignment: Alignment.center,
                                  backgroundColor: Color.fromRGBO(101, 99, 255, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                                  ),
                                ),
                              onPressed: (() {
                                context.push('/customdo');
                              }), 
                              child: Text("Mulai Kustomisasi"))
                          ],
                        ),
                      )
                    ],
                  ),),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width, height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file,size: 30, color: Color.fromRGBO(101, 99, 255, 1.0),),
                    SizedBox(height: 10,),
                    Text("Click to Upload File", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(height: 5,),
                    Text('Support for a single bulk Upload',
                            style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Text("Maximum file size 2MB.",
                            style: TextStyle(color: Colors.grey),)
                  ],
                ),
                  ),
              Container(
                width: MediaQuery.of(context).size.width, height: 150,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                    right: BorderSide(width: 1, color: Colors.grey),
                    left: BorderSide(width: 1, color: Colors.grey))),
                child: Column(
                  children: [
                    Container(padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin/2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 10,),
                            Text('Kirim Gambar',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            SizedBox(height: 10,),
                            
                            Text('Kustomisasi Sepatu sesuai Gambar yang Kalian Inginkan',
                            style: TextStyle(color: Colors.grey),)
                          ],
                        ),),
                    Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  alignment: Alignment.center,
                                  backgroundColor: Color.fromRGBO(101, 99, 255, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)
                                  ),
                                ),
                              onPressed: (() {
                                
                              }), 
                              child: Text("Kirim"))
                          ],
                        ),),
                    
                  ],
                ),
                  ),
            ],
          ),
        ),
      ),

    );
  }
}
