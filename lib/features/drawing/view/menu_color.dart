import 'package:drawing_app/features/drawing/controller/draw_controller.dart';
import 'package:flutter/material.dart';

class MenuColor extends StatefulWidget {
  final DrawController drawController;

  const MenuColor({Key key, this.drawController}) : super(key: key);

  @override
  _MenuColorState createState() => _MenuColorState();
}

class _MenuColorState extends State<MenuColor> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this._handleOnTapMenuColor,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Icon(
          Icons.color_lens,
          color: this.widget.drawController.currentColor,
          size: 30,
        ),
      ),
    );
  }

  void _handleOnTapMenuColor() {
    this._buildPalletColor();
  }

  Future<Color> _buildPalletColor() {
    return showDialog(
        context: this.context,
        barrierColor: Colors.white.withOpacity(0),
        builder: (_) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black, width: 3),
                color: Colors.white,
              ),
              child: Wrap(
                children: this
                    .widget
                    .drawController
                    .optionsColors
                    .map((color) => this._buildColorOption(color))
                    .toList(),
              ),
            ),
          );
        });
  }

  Widget _buildColorOption(Color color) {
    return GestureDetector(
      onTap: () => this._choseOptionColor(color),
      child: Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  void _choseOptionColor(Color color) {
    setState(() {
      this.widget.drawController.currentColor = color;
      Navigator.of(context).pop();
    });
  }
}
