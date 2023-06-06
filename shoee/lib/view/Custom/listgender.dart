import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/model/custom_const.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/view/Custom/customdata.dart';

class ListGend extends ConsumerStatefulWidget {
  
  const ListGend({super.key});

  @override
  _ListGendState createState() => _ListGendState();
}

class _ListGendState extends ConsumerState<ListGend> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gender.length,
      physics: ScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        
         return Container(
          padding: EdgeInsets.only(right: 5),
          child: ElevatedButton(
            onPressed: (() {
              setState(() {
                      selectedIndex = index;
                    });
              ref.watch(selectedgenderProvider).setSelectedgender(gender[index]);
            }),
            style: selectedIndex == index ? StyleButton.colorgrey : StyleButton.colorwhite,
            child: Text(gender[index], 
            style: TextStyle(
              color: selectedIndex == index ? Colors.white : Color.fromRGBO(108, 117, 125, 1.0)),)),
         );
      }));
  }
}