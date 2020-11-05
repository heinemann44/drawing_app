import 'package:drawing_app/features/drawing/controller/draw_controller.dart';
import 'package:flutter/material.dart';

class MenuEraser extends StatefulWidget {
  final DrawController drawController;

  const MenuEraser({Key key, this.drawController}) : super(key: key);

  @override
  _MenuEraserState createState() => _MenuEraserState();
}

class _MenuEraserState extends State<MenuEraser> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this._handleOnTapMenuEraser,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Image.asset(
          "./lib/assets/erase.png",
          width: 30,
          height: 30,
        ),
      ),
    );
  }

  void _handleOnTapMenuEraser() {
    this.widget.drawController.currentColor = Colors.white;
  }
}
