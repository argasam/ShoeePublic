import 'package:flutter/material.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 20.0;
class StyleButton{
  static ButtonStyle pressedbutton = ButtonStyle(
    alignment: Alignment.center,
    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(101, 99, 255, 1.0)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4)
    )),
    minimumSize: MaterialStateProperty.all(Size.zero),
    padding: MaterialStateProperty.all(EdgeInsets.all(5)),
    shadowColor: MaterialStateProperty.all(Colors.transparent)
    //tapTargetSize: MaterialTapTargetSize.shrinkWrap
  );
  static ButtonStyle unpressedbutton = ButtonStyle(
    alignment: Alignment.center,
    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(233, 233, 233, 1.0)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4)
    )),
    minimumSize: MaterialStateProperty.all(Size.zero),
    padding: MaterialStateProperty.all(EdgeInsets.all(5)),
    shadowColor: MaterialStateProperty.all(Colors.transparent)
    //tapTargetSize: MaterialTapTargetSize.shrinkWrap
  );
  static ButtonStyle colorwhite = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
      side: BorderSide(color: Color.fromRGBO(108, 117, 125, 1.0))
    )),
    shadowColor: MaterialStateProperty.all(Colors.transparent)
  );
  static ButtonStyle colorgrey = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(108, 117, 125, 1.0)),
    shadowColor: MaterialStateProperty.all(Colors.transparent)
  );
  static ButtonStyle cartbutton = ButtonStyle(
    alignment: Alignment.center,
    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(101, 99, 255, 1.0)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4)
    )),
    minimumSize: MaterialStateProperty.all(Size.zero),
    padding: MaterialStateProperty.all(EdgeInsets.all(5)),
    shadowColor: MaterialStateProperty.all(Colors.transparent)
    //tapTargetSize: MaterialTapTargetSize.shrinkWrap
  );
  static ButtonStyle buybutton = ButtonStyle(
    alignment: Alignment.center,
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
      side: BorderSide(color: Color.fromRGBO(101, 99, 255, 1.0))
    )),
    minimumSize: MaterialStateProperty.all(Size.zero),
    padding: MaterialStateProperty.all(EdgeInsets.all(5)),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    //tapTargetSize: MaterialTapTargetSize.shrinkWrap
  );
  
}