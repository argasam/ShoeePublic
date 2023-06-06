// lib/view/home_view.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/controller/querylogic.dart';


import 'package:shoee/model/shoe.dart';
import 'package:shoee/view/Home/categories.dart';
import 'package:shoee/view/Home/shoe_card.dart';
import 'package:shoee/view/acc_view.dart';

import 'package:shoee/view/bottom_navigation_bar_widget.dart';
import 'package:get/get.dart';
import 'package:shoee/view/cart_view.dart';
import 'package:shoee/view/custom_view.dart';
import 'package:shoee/view/details/details_view.dart';

import 'Home/categories.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key:key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController searchcontroller = TextEditingController();
  final _db = FirebaseFirestore.instance;
  List<Shoe> shoeList = [];
  List<Map<String, dynamic>> stocklist = [];
  @override
  void initState() {
    super.initState();
    var queryLogic = QueryLogic(); 
    queryLogic.loadshoes().then((list) {
      setState(() {
        shoeList = list; // Update the shoe list state variable with the fetched list
      });
    });
    
  }
 
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Home(
        searchcontroller: searchcontroller,
        shoeList: shoeList,),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
    required this.searchcontroller,
    required this.shoeList,
  }) : super(key: key);

  final TextEditingController searchcontroller;
  final List<Shoe> shoeList;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
      
            // Container(
            //   padding: EdgeInsets.all(20.0),
            //   child: Row(
            //     //mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Expanded(
            //         flex: 1,
            //         child: SizedBox(
            //           height: 31,
            //           width: 500,
            //           child: TextField(
            //             controller: searchcontroller,
            //             autofocus: true,
            //             textAlignVertical: TextAlignVertical.center,
            //             decoration: InputDecoration(
            //               contentPadding: EdgeInsets.only(bottom: 5.0, right: 10.0, left: 10.0),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.only(
            //                   topLeft: Radius.circular(3.2),
            //                   bottomLeft: Radius.circular(3.2),
            //                 )
            //               ) 
            //             ),
            //             style: TextStyle(fontSize: 16.0, color: Colors.black),
            //           ),
            //         ),
            //       ),
                  
            //       Expanded(
                    
            //         child: SizedBox(
            //           height: 31,
            //           width: 88,
            //           child: ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               alignment: Alignment.center,
            //               backgroundColor: Color.fromRGBO(101, 99, 255, 1.0),
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.only(
            //                   topRight: Radius.circular(3.2),
            //                   bottomRight: Radius.circular(3.2)
            //                 )
            //               ),
            //             ),
            //             onPressed: (){
            //             },
            //             child: Row(
            //               children: [
            //                 Icon(Icons.search),
            //                 Text(
            //                   "Search",
            //                   style: TextStyle(fontSize: 16),
            //                   ),
            //               ],
            //             )
            //           ),
            //         ),
            //       ),
    
            //       Expanded(
                    
            //         child: IconButton(
            //           icon: Icon(Icons.notifications),
            //           onPressed: (() {
                        
            //           }),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Text("Produk Tebaru"),
            ),
            Container(
              color: Color.fromRGBO(101, 99, 255, 1.0),
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.stretch,
                children: [
                Image(image: AssetImage("assets/images/sepatubanner.png"), 
                fit: BoxFit.fill,
                )
              ],)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Text("Kategori"),
            ),
            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              
              child: Categories()),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin/4),
              child: GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: shoeList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.8
                  ), 
                itemBuilder: ((context, index) {
                  Shoe shoe = shoeList[index];
                  return shoe_card(
                    shoe: shoe,
                    press: () => context.push('/details', extra: shoe)
                          ,);
                })),),
            
               
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
     final TextEditingController searchController = TextEditingController();

  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 31,
                    width: MediaQuery.of(context).size.width/1.8,
                    child: TextField(
                      controller: searchcontroller,
                      autofocus: true,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5.0, right: 10.0, left: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3.2),
                            bottomLeft: Radius.circular(3.2),
                          )
                        ) 
                      ),
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ),
                  
                  SizedBox(
                    height: 31,
                    width: MediaQuery.of(context).size.width/4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        backgroundColor: Color.fromRGBO(101, 99, 255, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(3.2),
                            bottomRight: Radius.circular(3.2)
                          )
                        ),
                      ),
                      onPressed: (){
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                          Text(
                            "Search",
                            style: TextStyle(fontSize: 16),
                            ),
                        ],
                      )
                    ),
                  ),
    
                  IconButton(
                    style: ButtonStyle(),
                    icon: Icon(Icons.notifications, color: Color.fromRGBO(101, 99, 255, 1.0)),
                    onPressed: (() {
                      
                    }),
                  ),
                ],
              ),
  );
  }
}






