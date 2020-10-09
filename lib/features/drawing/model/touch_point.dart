import 'package:flutter/material.dart';

enum TouchPointType { TAP, MOVE }

class TouchPoint {
  Paint paint;
  Offset coordinates;
  TouchPointType type;

  TouchPoint({
    this.paint,
    this.coordinates,
    this.type,
  });
}
