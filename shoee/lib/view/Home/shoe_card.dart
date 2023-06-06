

import 'package:flutter/material.dart';
import 'package:shoee/constants.dart';
import 'package:shoee/model/shoe.dart';

class shoe_card extends StatelessWidget {
  final Shoe shoe;
  final VoidCallback press;
  //final Future? press;

  const shoe_card({
    Key? key, 
    required this.shoe, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      // () => press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: Image.network(shoe.image)),
            ),
            SizedBox(height: 5,),
            Text(shoe.brand),
            SizedBox(height: 5,),
            Text(shoe.name),
            SizedBox(height: 5,),
            Text("Rp${shoe.price}")
          ]),
      ),
    );
  }
}