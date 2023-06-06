import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/model/custom_const.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/view/Custom/customdata.dart';

class ListSize extends ConsumerStatefulWidget {
  
  const ListSize({super.key});

  @override
  _ListSizeState createState() => _ListSizeState();
}

class _ListSizeState extends ConsumerState<ListSize> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: size.length,
      physics: ScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        
         return Container(
          width: 55,
          padding: EdgeInsets.only(right: 5),
          child: ElevatedButton(
            onPressed: (() {
              setState(() {
                      selectedIndex = index;
                    });
              ref.watch(selectedsizeProvider).setSelectedsize(size[index]);
            }),
            style: selectedIndex == index ? StyleButton.colorgrey.copyWith(
              minimumSize: MaterialStateProperty.all(Size.zero),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 3)),) 
              : StyleButton.colorwhite,
            child: Text(size[index].toString(),
            
            style: TextStyle(
              color: selectedIndex == index ? Colors.white : Color.fromRGBO(108, 117, 125, 1.0)),)),
         );
      }));
  }
}