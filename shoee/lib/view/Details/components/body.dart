import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/controller/querylogic.dart';
import 'package:shoee/model/sex.dart';
import 'package:shoee/model/shoe.dart';
import 'package:shoee/model/shoe_stock.dart';
import 'package:shoee/model/shoe_type.dart';
import 'package:shoee/model/shoesize.dart';
import 'package:shoee/view/Details/components/colorbox.dart';
import 'package:shoee/view/Details/components/sizebox.dart';
import 'package:intl/intl.dart';
import 'package:shoee/controller/string_extension.dart';
import 'package:shoee/view/Details/size_notifier.dart';

class Body extends ConsumerStatefulWidget {
  final Shoe shoe;
  
  const Body({Key? key, required this.shoe}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends ConsumerState<Body> {
  
  List<Map<String, dynamic>> stocklist = [];
  List<Map<String, dynamic>> colorlist = [];
  @override
  void initState() {
    super.initState();
    var queryLogic = QueryLogic(); 
    queryLogic.loadsize(widget.shoe).then((list) {
      setState(() {
        stocklist = list; // Update the shoe list state variable with the fetched list
      });
    });
    queryLogic.loadcolor(widget.shoe).then((list) {
      setState(() {
        colorlist = list; // Update the shoe list state variable with the fetched list
      });
    });
  }
  

  @override
  
  
  Widget build(BuildContext context) {
    
    String imagecolor = ref.read(selectedColorProvider).initialcolor.toString();//final Shoe_Stock pilih = stocks[shoe.id-1];
    var imageQuery = FirebaseFirestore.instance
    .collection('shoes')
    .doc(widget.shoe.id)
    .collection('colors')
    .where('color', isEqualTo: imagecolor)
    .limit(1);
    var imageSnapshot = imageQuery.get();
    Size size = MediaQuery.of(context).size;
    
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Container(
              color: Color.fromRGBO(228, 228, 228, 1.0),
              
              width: size.width,
              child: Image.network(widget.shoe.image, height: 229, 
              fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            
            padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text((widget.shoe.type).capitalize()),
                Text(widget.shoe.brand),
                Text(widget.shoe.name),
                Text("\Rp${widget.shoe.price}\,00"),
                
              ],
          
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RatingBar.builder(
                  direction: Axis.horizontal,
                  itemCount: 5,
                  initialRating: widget.shoe.rating.toDouble(),
                  itemBuilder: ((context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,)), 
                  onRatingUpdate: ((rating) {
                    print(rating);
                  }),
                  updateOnDrag: true,
                ),
                
              ],
            ),
          ),
          Text("warna"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:kDefaultPaddin),
            child: ColorBox(shoe: widget.shoe)),
          Text("Ukuran"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:kDefaultPaddin),
            child: SizeBox(shoe: widget.shoe),
          ),
          Text("Deskripsi"),
          Text(widget.shoe.description),
        ],
      ),
    );
  }

  // GridView SizeBox() {
  //   return GridView.builder(
  //           //scrollDirection: Axis.horizontal,
  //           shrinkWrap: true,
  //           physics: ScrollPhysics(),
  //           itemCount: widget.shoe.sex == Sex.Mens ? menSize.length : womenSize.length,
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 6,
  //             childAspectRatio: 4 / 2,
              
  //             crossAxisSpacing: kDefaultPaddin/4,
  //             mainAxisSpacing: kDefaultPaddin/4
  //             ),
  //           itemBuilder: ((context, index) {
  //             return Container(
  //               alignment: Alignment.center,
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                   setState(() {
  //                     selectedIndex = index;
  //                   });
  //                 },
  //                 style: selectedIndex == index ? StyleButton.colorgrey : StyleButton.colorwhite,
  //                 child: Text(menSize[index].toString())
  //               ),
  //             );
  //           }));
}
