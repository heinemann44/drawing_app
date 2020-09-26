import 'package:drawing_app/features/drawing/model/touch_point.dart';
import 'package:drawing_app/features/drawing/view/painter.dart';
import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  List<TouchPoint> points;

  StrokeCap defaultStrokeCap = StrokeCap.round;
  Color defaultColor = Colors.black;
  double defaultOpacity = 1.0;
  double defaultStrokeWidth = 3.0;

  @override
  void initState() {
    super.initState();
    this.points = List();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: this._buildAppBar(),
        body: this._buildBody(),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("Draw!"),
    );
  }

  Widget _buildBody() {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: GestureDetector(
          onPanStart: this._savePointsStart,
          onPanUpdate: this._savePointsUpdate,
          onPanEnd: this._saveEndPoint,
          child: Stack(
            children: [
              this._buildBoxDraw(),
              CustomPaint(
                size: Size.square(300),
                painter: Painter(points: this.points),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBoxDraw() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
    );
  }

  void _savePointsStart(DragStartDetails details) {
    setState(() {
      this.points.add(TouchPoint(
            coordinates: details.localPosition,
            paint: Paint()
              ..strokeCap = this.defaultStrokeCap
              ..isAntiAlias = true
              ..color = this.defaultColor.withOpacity(this.defaultOpacity)
              ..strokeWidth = this.defaultStrokeWidth,
          ));
    });
  }

  void _savePointsUpdate(DragUpdateDetails details) {
    setState(() {
      this.points.add(TouchPoint(
            coordinates: details.localPosition,
            paint: Paint()
              ..strokeCap = this.defaultStrokeCap
              ..isAntiAlias = true
              ..color = this.defaultColor.withOpacity(this.defaultOpacity)
              ..strokeWidth = this.defaultStrokeWidth,
          ));
    });
  }

  void _saveEndPoint(DragEndDetails details) {
    setState(() => this.points.add(null));
  }
}
