import 'package:drawing_app/features/drawing/model/touch_point.dart';
import 'package:flutter/foundation.dart';
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
  double currentStroke;
  ValueNotifier<double> valueStroke;

  List<TouchPoint> points;

  DrawController(){
    this.isOpenMenu = false;
    this.currentColor = Colors.black;
    this.currentStroke = 3.0;
    this.valueStroke = ValueNotifier<double>(this.currentStroke);
  }

  void updateMenuState(){
    this.isOpenMenu = !this.isOpenMenu;
  }

  void resetDraw(){
    this.points.clear();
  }
}