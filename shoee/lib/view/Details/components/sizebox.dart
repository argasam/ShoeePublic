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

class SizeBox extends ConsumerStatefulWidget {
  final Shoe shoe;
  
  const SizeBox({Key? key, required this.shoe}) : super(key: key);
  
  

  @override
  _SizedBoxState createState() => _SizedBoxState();
}

class _SizedBoxState extends ConsumerState<SizeBox> {
  
  bool isButtonDisabled = false;
  int selectedIndex = 0;
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
  }
  
  @override
  Widget build(BuildContext context) {
    
    
    return GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: widget.shoe.sex == 'men' ? menSize.length : womenSize.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              childAspectRatio: 4 / 2,
              
              crossAxisSpacing: kDefaultPaddin/4,
              mainAxisSpacing: kDefaultPaddin/4
              ),
            itemBuilder: ((context, index) {
              final sizeList = widget.shoe.sex == 'men' ? menSize : womenSize;
              final selectedSize = sizeList[index];
              final matchingStock = stocklist.firstWhere(
                (map) => map['size'] == "$selectedSize",
                orElse: () => {'stock': 0},
              );
              if (matchingStock['stock'] > 0){
                return Container(
                alignment: Alignment.center,
                child: 
                
                ElevatedButton(
                  onPressed: ()
                  {
                    setState(() {
                      selectedIndex = index;
                    });
                    
                    
                    ref.watch(selectedSizeProvider.notifier).setSelectedSize("$selectedSize") ;
                  },
                  style: selectedIndex == index ? StyleButton.colorgrey : StyleButton.colorwhite,
                  child: Text(sizeList[index].toString(),
                              style: TextStyle(
                                color: selectedIndex == index ? Colors.white : Colors.black),)
                ),
              );
              }else{
                return Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text(menSize[index].toString()),
                  ),
                );
              }
              
            }));
  }
}