import 'dart:ui';

import 'package:drawing_app/features/drawing/model/touch_point.dart';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  List<TouchPoint> points;

  Painter({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    if (this.points?.isNotEmpty ?? false) {
      for (int i = 0; i < this.points.length - 1; i++) {
        TouchPoint currentPoint = this.points[i];
        TouchPoint nextPoint = this.points[i + 1];

        if(nextPoint.type == TouchPointType.MOVE){
          canvas.drawLine(currentPoint.coordinates, nextPoint.coordinates, currentPoint.paint);
        }else {
          canvas.drawCircle(currentPoint.coordinates, currentPoint.paint.strokeWidth, currentPoint.paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
