import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/controller/querylogic.dart';
import 'package:shoee/view/Custom/customdata.dart';
import 'package:shoee/view/Custom/listbahan.dart';
import 'package:shoee/view/Custom/listgender.dart';
import 'package:shoee/view/Custom/listsize.dart';
import 'package:shoee/view/Custom/listtipe.dart';
import 'package:shoee/view/Custom/listwarna.dart';

class AddCustom extends ConsumerStatefulWidget {
  const AddCustom({Key? key}) : super(key:key);

  @override
  _AddCustomState createState() => _AddCustomState();
}

class _AddCustomState extends ConsumerState<AddCustom> {
  List<Map<String, dynamic>> vendorlist = [];
  List<Map<String, dynamic>> customlist = [];
  final _db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  
  @override

  void initState() {
    super.initState();
    var queryLogic = QueryLogic(); 
    queryLogic.loadvendor().then((list) {
      setState(() {
        vendorlist = list; // Update the shoe list state variable with the fetched list
      });
    });
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
        elevation: 0,
        backgroundColor: Colors.white ,
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: (() => context.pop(context)), ),),
        body: SingleChildScrollView(
          child: Container(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      Text('Compass',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      SizedBox(height: 5,),
                      Text('Proto Lite Purple Compass',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
            
                    children: [
                      SizedBox(
                        height: 200,
                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/shoee-3c816.appspot.com/o/View%2Fimage%205.png?alt=media&token=f8d886ff-c944-4f14-92cb-f44c56c7a566", 
                        fit: BoxFit.contain,) ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Gender",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        SizedBox(height: 5,),
                        Container(
                          height: 30,
                          child: ListGend(),
                        ),
                        SizedBox(height: 15,),
                        Text("Ukuran Sepatu",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        SizedBox(height: 5,),
                        Container(
                          height: 30,
                          child: ListSize(),
                        ),
                        SizedBox(height: 15,),
                        Text("Tipe Kaki",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        SizedBox(height: 5,),
                        Container(
                          height: 30,
                          child: ListTipe(),
                        ),
                        SizedBox(height: 15,),
                        Text("Bahan",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        SizedBox(height: 5,),
                        Container(
                          height: 30,
                          child: ListBahan(),
                        ),
                        SizedBox(height: 15,),
                        Text('Warna',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        SizedBox(height: 5,),
                        Container(
                          height: 30,
                          child: ListWarna(),
                        ),
                      ],
                    ),
                  ),
                ),
              
              Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${customlist.length}'),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(101, 99, 255, 1.0),
                      ),
                      onPressed: (() {
                        context.go('/choosevendor');
                      }), 
                      child: Text('Pesan Desain', 
                      style: TextStyle(color: Colors.white, fontSize: 14),))
                  ],
                ),
              )
              ],
            ), ),
        ),
    );
  }

}