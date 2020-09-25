import 'dart:ui';

import 'package:drawing_app/features/drawing/model/touch_point.dart';
import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  List<TouchPoint> points;
  List<Offset> coordinatePoints;

  Painter({this.points}) {
    this.coordinatePoints = List();
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < this.points.length - 1; i++) {
      if (this._hasNextPoint(i)) {
        canvas.drawLine(
          this.points[i].coordinates,
          this.points[i + 1].coordinates,
          this.points[i].paint,
        );
      } else if (this._pointExist(i)) {
        this.coordinatePoints.clear();
        this.coordinatePoints.add(this.points[i].coordinates);
        this.coordinatePoints.add(Offset(
              this.points[i].coordinates.dx + 0.1,
              this.points[i].coordinates.dy + 0.1,
            ));

        canvas.drawPoints(PointMode.points, this.coordinatePoints, this.points[i].paint);
      }
    }
  }

  bool _hasNextPoint(int index) {
    return this._pointExist(index) && this._pointExist(index + 1);
  }

  bool _pointExist(int index) {
    return this.points[index] != null;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
