import 'package:drawing_app/features/drawing/model/touch_point.dart';
import 'package:drawing_app/features/drawing/view/painter.dart';
import 'package:flutter/material.dart';

class DrawerTable extends StatefulWidget {
  final Size size;

  const DrawerTable({Key key, this.size}) : super(key: key);

  @override
  _DrawerTableState createState() => _DrawerTableState();
}

class _DrawerTableState extends State<DrawerTable> {
  GlobalKey _painterKey;

  List<TouchPoint> points;

  StrokeCap defaultStrokeCap = StrokeCap.round;
  Color defaultColor = Colors.black;
  double defaultOpacity = 1.0;
  double defaultStrokeWidth = 3.0;

  @override
  void initState() {
    this._painterKey = GlobalKey();
    this.points = List();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: this.widget.size.height,
      maxWidth: this.widget.size.width,
      child: GestureDetector(
        onVerticalDragUpdate: (_) {},
        child: Listener(
          onPointerDown: (event) => this._addPoint(event, TouchPointType.TAP),
          onPointerUp: (event) => this._addPoint(event, TouchPointType.TAP),
          onPointerMove: (event) => this._addPoint(event, TouchPointType.MOVE),
          child: RepaintBoundary(
            child: CustomPaint(
              key: this._painterKey,
              painter: Painter(points: this.points),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: this.widget.size.width,
                  minHeight: this.widget.size.height,
                  maxWidth: this.widget.size.width,
                  maxHeight: this.widget.size.height,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addPoint(PointerEvent event, TouchPointType type) {
    Offset offset = this._getLocalOffset(event.position);

    if (this.isInDrawArea(offset)) {
      if (this.points.length != 0 && this._isFar(offset)) {
        type = TouchPointType.TAP;
      }
      setState(() {
        this.points.add(TouchPoint(
              type: type,
              coordinates: offset,
              paint: Paint()
                ..strokeCap = this.defaultStrokeCap
                ..isAntiAlias = true
                ..color = this.defaultColor.withOpacity(this.defaultOpacity)
                ..strokeWidth = this.defaultStrokeWidth,
            ));
      });
    }
  }

  bool isInDrawArea(Offset position) {
    return (position.dx > 0 && position.dx < this.widget.size.width) &&
        (position.dy > 0 && position.dy < this.widget.size.height);
  }

  Offset _getLocalOffset(Offset position) {
    RenderBox box = this.context.findRenderObject();
    return box.globalToLocal(position);
  }

  bool _isFar(Offset offset1) {
    Offset offset2 = this.points.last.coordinates;
    return (offset1.dx - offset2.dx).abs() > 60 ||
        (offset1.dy - offset2.dy).abs() > 60;
  }
}
