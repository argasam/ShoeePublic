import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/controller/querylogic.dart';

class CustomHistory extends StatefulWidget {
  const CustomHistory({super.key});

  @override
  State<CustomHistory> createState() => _CustomHistoryState();
}

class _CustomHistoryState extends State<CustomHistory> {
  List<Map<String, dynamic>> customlist = [];
  final _db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    var queryLogic = QueryLogic(); 
    queryLogic.loadcustom(auth.currentUser?.uid?? '').then((list) {
      setState(() {
        customlist = list; // Update the shoe list state variable with the fetched list
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
        title: Text('Riwayat Kustomisasi', style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold,
        fontSize: 18
        ),),
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: (() => context.pop(context)), ), 
        actions: []),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(kDefaultPaddin),
          child: Expanded(
            child: ListView.builder(
              itemCount: customlist.length,
              itemBuilder: ((context, index) {

                final selectedcustomlist = customlist[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                  border:   Border.all(color: Colors.grey)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 100,
                            child: Image.network(selectedcustomlist['image']),
                          ),
                          Container(
                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(selectedcustomlist['nama']),
                                SizedBox(height: 10,),
                                Text(selectedcustomlist['bahan']),
                                SizedBox(height: 10,),
                                Text(selectedcustomlist['size']),
                                SizedBox(height: 10,),
                                Text(selectedcustomlist["warna"])
                              ],
                          
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Container(
                                  color: selectedcustomlist["status"] == 1 ? Colors.red : Colors.green,
                                  child: selectedcustomlist["status"] == 1 ? Text("Diproses") : Text("Selesai") ),
                              )
                            ],
                            ),
                          ),
                          
                        ],
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                );
              })) ),
        )

      ),
    );
  }
}