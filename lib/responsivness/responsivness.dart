import 'package:flutter/material.dart';

class Responsive{
  static late double screenHeight;
  static late double screenWidth;

  static init(BuildContext context){
    screenHeight =  MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
}