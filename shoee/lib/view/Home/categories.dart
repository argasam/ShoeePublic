import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/constants.dart';


class Categories extends StatefulWidget{
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>{
  List<String> categories = ["All", "Sneakers", "Boots", "Sandal", "Olahraga"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 11),
      child: SizedBox(
        height: 31,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index)),
      ),
    );
  }

  Widget buildCategory(int index) {
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          SizedBox(
            height: 31,
            width: getSize(index),
            
            child: ElevatedButton(
              onPressed:() {
                setState(() {
                  selectedIndex = index;
                });
              },
              
              style: selectedIndex == index ? StyleButton.pressedbutton : StyleButton.unpressedbutton,
              child: Text(categories[index],
              style: TextStyle(color: selectedIndex == index ? Colors.white : Colors.black),
              ),
              ),
          ),
        ],
      ),
    );
  }
}

double getSize(int index) {
  double result = 0; // non-nullable
  print(result.abs());
  if (index == 0){
    result = 35.0;
  }
  else if (index == 1){
    result = 79.0;
  }
  else if (index == 2){
    result = 57.0;
  }
  else if (index == 3){
    result = 63.0;
  }
  else{
    result = 75.0;
  }
  print(result.abs()); // ok now
  return result;
} 

