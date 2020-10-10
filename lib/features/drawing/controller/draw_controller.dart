import 'package:flutter/material.dart';

class DrawController{
  final int timeAnimation = 300;
  final List<Color> optionsColors  = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
  ];

  bool isOpenMenu;
  Color currentColor;

  DrawController(){
    this.isOpenMenu = false;
    this.currentColor = Colors.black;
  }

  void updateMenuState(){
    this.isOpenMenu = !this.isOpenMenu;
  }
}