import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/model/cart.dart';

class BuyView extends StatefulWidget {
  final List<CartItem> cartList;
  final List<CartItem> choosenItems;
  final double totalPrice;
  const BuyView({Key? key, required this.choosenItems, required this.totalPrice, required this.cartList}): super(key:key);

  @override
  State<BuyView> createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        color: Colors.grey,
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Alamat Pengiriman', style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text('Dhiya Risalah Ghaida',style: TextStyle(color: Colors.black, fontSize: 12),),
                  Text('(+62) 82312345678', style: TextStyle(color: Colors.black, fontSize: 12),),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text('Jalan Dago Asri III Blok J No.4 Dago, Coblong, Kota Bandung, Jawa Barat 41035',
                    style: TextStyle(color: Colors.black, fontSize: 12)))
                ],
              ),
            ),
            Text('Ringkasan Pembelian', style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
            Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.choosenItems.length,
                itemBuilder: ((context, index) {
                  var selecteditems = widget.choosenItems[index];
                  return Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(widget.choosenItems[index].image)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(selecteditems.brand),
                            Text(selecteditems.name),
                            Row(
                              children: [
                                Text('Ukuran: ${selecteditems.size}'),
                                Text('Warna: ${selecteditems.color}')
                              ],
                            ),
                            Text('Rp${selecteditems.price}.00')
                          ],
                        )
                      ],
                    ),
                  );
                }))
            ),
            Text('Rincian Pembayaran', style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Subtotal'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Subtotal Produk'),
                      Text("Rp ${widget.totalPrice},00"),
                      
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Subtotal Pengiriman'),
                      Text("Rp12000,00")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Subtotal Layanan'),
                      Text("Rp3000,00")
                    ],
                  ),
                  Container(
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Total'),
                        Text("Rp${widget.totalPrice+3000+12000},00")
                      ],
                    ),
                  )

                ],)
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (() {
                      widget.cartList.removeWhere((cartItem) => widget.choosenItems.contains(cartItem));
                      context.go('/home');

                    }),
                    style: StyleButton.cartbutton.copyWith(
                      fixedSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.width/3, 40))
                    ),
                    child: Text('Konfirmasi Pesanan',
                    style: TextStyle(color: Colors.white),))
                  ],
              ),
            )

          ],
        ),
      ),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text('Konfirmasi Pesanan', style: TextStyle(
        color: Colors.black,
        fontSize: 18
      ),),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: (() => context.pop(context)), ),
    );
  }
}