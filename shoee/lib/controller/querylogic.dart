import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/controller/cartstate.dart';
import 'package:shoee/model/cart.dart';
import 'package:shoee/model/shoe.dart';
import 'package:shoee/model/user.dart';
import 'package:shoee/view/cart_view.dart';

class QueryLogic{
  late final Ref ref;
  final _db = FirebaseFirestore.instance;
  
  Future<List<Shoe>> loadshoes() async {
    try {
    QuerySnapshot shoes = await _db.collection('shoes').get();
    List<DocumentSnapshot> shoeslist = shoes.docs;
    List<Shoe> shoeList = [];
    for (DocumentSnapshot doc in shoeslist){
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Shoe shoe = Shoe(
        id : doc.id,
        name: data['name'], 
        brand: data['brand'], 
        image: data['image'], 
        sex: data['sex'], 
        type: data['type'], 
        description: 
        data['description'], 
        price: data['price'], 
        rating: data['rating']);
      
      shoeList.add(shoe);
    }
    return shoeList;
    } catch (e) {
      print('Error retrieving shoe list: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> loadsize(Shoe shoe) async {
    try {
      QuerySnapshot shoessizes = await _db.collection('shoes').doc(shoe.id).collection('sizes').get();
      List<DocumentSnapshot> stocklist = shoessizes.docs;
      List<Map<String, dynamic>> sizelist = [];
      for(DocumentSnapshot doc in stocklist){
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        sizelist.add(data);
      }
      return sizelist;
    } catch (e) {
      print('Error retrieving shoe list: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> loadcolor(Shoe shoe) async {
    try {
      QuerySnapshot shoescolors = await _db.collection('shoes').doc(shoe.id).collection('colors').get();
      List<DocumentSnapshot> colorlist = shoescolors.docs;
      List<Map<String, dynamic>> colorimagelist = [];
      for(DocumentSnapshot doc in colorlist){
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        colorimagelist.add(data);
      }
      return colorimagelist;
    } catch (e) {
      print('Error retrieving shoe list: $e');
      return [];
    }
  }

  Future<void> addtocart(Shoe shoe, String uid, String color, String size, String image) async{

    try {
      DocumentReference user = _db.collection('users').doc(uid);
      DocumentReference cart = user.collection('cart').doc(shoe.id);
      DocumentSnapshot cartitem = await user.collection('cart').doc(shoe.id).get();
      DocumentSnapshot item = await _db.collection('shoes').doc(shoe.id).get();
      final itemreference = item.reference;
      if (item.exists){
        bool cartExists = await user.collection('cart').limit(1).get().then((snapshot) => snapshot.docs.isNotEmpty);

        if (cartExists) {
          // 'cart' collection already exists, add the document to it
          cart.set({
            'product' : shoe.name,
            'quantity' : 1,
            'color' : color,
            'size' : size,
            'image' : image
          });
        } else {
          // 'cart' collection doesn't exist, create it and add the document
          await user.collection('cart').doc(shoe.id).set({
            'product' : shoe.name,
            'quantity' : 1,
            'color' : color,
            'size' : size,
            'image' : image
          });
        }
        // final cartState = ref.read(cartStateProvider);
        // cartState.setSuccessMessage('Product added to cart successfully');
      } else {
        // final cartState = ref.read(cartStateProvider);
        // cartState.setFailed('Item Already Added');
      }
    } catch (e) {
      // final cartState = ref.read(cartStateProvider);
      // cartState.setFailed('Error');
    }

  }

  Future<List<Map<String, dynamic>>> loadvendor() async {
    try {
      QuerySnapshot vendors = await _db.collection('vendors').get();
      List<DocumentSnapshot> vendorslist = vendors.docs;
      List<Map<String, dynamic>> vendorsdetaillist = [];

      for(DocumentSnapshot doc in vendorslist){
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        vendorsdetaillist.add(data);
      }
      return vendorsdetaillist;
    } catch (e) {
      print('Error retrieving shoe list: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> loadcustom(String uid) async {
    try {
      QuerySnapshot customs = await _db.collection('users').doc(uid).collection('customs').get();
      List<DocumentSnapshot> customslist = customs.docs;
      List<Map<String, dynamic>> customsdetaillist = [];

      for(DocumentSnapshot doc in customslist){
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        customsdetaillist.add(data);
      }
      return customsdetaillist;
    } catch (e) {
      print('Error retrieving shoe list: $e');
      return [];
    }
  }

  Future<List<CartItem>> loadcart(String uid) async {
    try {
      QuerySnapshot usercart = await _db.collection('users').doc(uid).collection('cart').get();
      List<CartItem> listcart = [];
      List<DocumentSnapshot> usercartlist = usercart.docs;
      // DocumentReference cart = user.collection('cart').doc(shoe.id);
      // QuerySnapshot vendors = await _db.collection('vendors').get();
      // List<DocumentSnapshot> vendorslist = vendors.docs;
      for(DocumentSnapshot doc in usercartlist){
        Map<String, dynamic> datacart = doc.data() as Map<String, dynamic>;
        DocumentReference productRef = doc['product'];
        DocumentSnapshot productSnapshot = await productRef.get();
        
        
        CartItem cart = CartItem(
          name: productSnapshot['name'],
          brand: productSnapshot['brand'],
          color: datacart['color'],
          price: productSnapshot['price'],
          quantity: datacart['quantity'],
          size: datacart['size'],
          image: datacart['image']
        );

        listcart.add(cart);
      }
      return listcart;
    } catch (e) {
      print('Error retrieving shoe list: $e');
      return [];
    }
  }


}