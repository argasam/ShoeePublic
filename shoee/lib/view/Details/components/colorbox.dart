import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/controller/querylogic.dart';
import 'package:shoee/model/sex.dart';
import 'package:shoee/model/shoe.dart';
import 'package:shoee/model/shoesize.dart';
import 'package:shoee/view/Details/size_notifier.dart';

class ColorBox extends ConsumerStatefulWidget {
  final Shoe shoe;
  
  const ColorBox({Key? key, required this.shoe}) : super(key: key);
  
  

  @override
  _ColorBoxState createState() => _ColorBoxState();
}

class _ColorBoxState extends ConsumerState<ColorBox> {
  
  bool isButtonDisabled = false;
  int selectedIndex = 0;
  
  List<Map<String, dynamic>> colorlist = [];
  
  @override
  void initState() {
    super.initState();
    var queryLogic = QueryLogic(); 
    
    queryLogic.loadcolor(widget.shoe).then((list) {
      setState(() {
        colorlist = list; // Update the shoe list state variable with the fetched list
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      height: 120 ,
      
      child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: colorlist.length,
              
              itemBuilder: ((context, index) {
                final selectedColor = colorlist[index]["color"];
                final selectedImage = colorlist[index]["image"];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedIndex == index ? Colors.black : Colors.transparent, // Add border color based on selected index
                      width: 1,
                    )),
                  child: InkWell(
                    onTap: (() {
                      setState(() {
                        selectedIndex = index;
                      });
                      ref.watch(selectedColorProvider.notifier).setSelectedColor(selectedColor.toString(), selectedImage.toString());
                    }),
                    child: SizedBox(
                      
                      width: 95 ,
                      child: Image.network(colorlist[index]['image'],
                      fit: BoxFit.fill,)),
                  ),
                );
              })),
    );
  }
}