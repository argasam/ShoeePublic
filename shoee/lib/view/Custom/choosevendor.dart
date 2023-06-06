import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/controller/querylogic.dart';
import 'package:shoee/model/custom_const.dart';
import 'package:shoee/view/Custom/customdata.dart';

class ChooseVendor extends ConsumerStatefulWidget {
  const ChooseVendor({super.key});

  @override
  _ChooseVendorState createState() => _ChooseVendorState();
}

class _ChooseVendorState extends ConsumerState<ChooseVendor> {
  List<Map<String, dynamic>> vendorlist = [];
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
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Pilih Produsen', style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold,
        fontSize: 18
        ),),
        leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: (() => context.pop(context)), ), 
        actions: []),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPaddin ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: vendorlist.length,
                  itemBuilder: ((context, index) {
                    final selectedVendor = vendorlist[index];
                    final selectedVendorDays = selectedVendor['days'];
                    final selectedVendorPrice = selectedVendor['price'];
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: StyleButton.colorwhite,
                        onPressed: () {
                          final customs = _db.collection('users').doc(auth.currentUser?.uid?? '').collection('customs');
                          customs.add(
                            {
                              'nama' : 'Proto Lite Purple Compass',
                              'brand' : 'Compass',
                              'bahan': ref.watch(selectedbahanProvider).initialbahan.toString(),
                              'tipe' : ref.watch(selectedtipeProvider).initialtipe.toString(),
                              "warna" : ref.watch(selectedwarnaProvider).initialwarna.toString(),
                              'size' : ref.watch(selectedsizeProvider).initialsize.toString(),
                              'gender' : ref.watch(selectedgenderProvider).initialgender.toString(),
                              "status" : 1,
                              'image' : "https://firebasestorage.googleapis.com/v0/b/shoee-3c816.appspot.com/o/View%2Fimage%205.png?alt=media&token=f8d886ff-c944-4f14-92cb-f44c56c7a566",

                            });
                          context.go("/custom");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(selectedVendor['name'], 
                                  style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 16)
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("Durasi Pengerjaan : ${selectedVendorDays}", 
                              style: TextStyle(
                              color:Colors.black,
                              fontSize: 12)
                            ),
                            SizedBox(height: 10,),
                            Text("\Rp${selectedVendorPrice}\,00",
                              style: TextStyle(
                              color:Colors.black,
                              fontSize: 16)
                            ),
                            
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    );
                  })),
              ),
            ],
          ), ),
    );
  }
}