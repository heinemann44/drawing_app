import 'package:drawing_app/features/drawing/controller/draw_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MenuStroke extends StatefulWidget {
  final DrawController drawController;

  const MenuStroke({Key key, this.drawController}) : super(key: key);

  @override
  _MenuStrokeState createState() => _MenuStrokeState();
}

class _MenuStrokeState extends State<MenuStroke> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this._handleOnTapMenuStroke,
      child: Container(
        width: 30,
        height: 40,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(Icons.create, size: 30),
            ValueListenableBuilder<double>(
              valueListenable: this.widget.drawController.valueStroke,
              builder: (_, value, ___) {
                return Container(
                  width: 30,
                  height: value,
                  color: Colors.black,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleOnTapMenuStroke() {
    this._buildSliderStroke();
  }

  Future<double> _buildSliderStroke() {
    return showDialog(
      context: this.context,
      barrierColor: Colors.white.withOpacity(0),
      builder: (_) {
        return SliderPicker(
          drawController: this.widget.drawController,
        );
      },
    );
  }
}

class SliderPicker extends StatefulWidget {
  final DrawController drawController;

  const SliderPicker({Key key, this.drawController}) : super(key: key);

  @override
  _SliderPickerState createState() => _SliderPickerState();
}

class _SliderPickerState extends State<SliderPicker> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 3),
          color: Colors.white,
        ),
        child: Card(
          child: Slider(
            value: this.widget.drawController.currentStroke,
            min: 1,
            max: 10,
            onChanged: (value) {
              this.widget.drawController.valueStroke.value = value;
              setState(() => this.widget.drawController.currentStroke = value);
            },
          ),
        ),
      ),
    );
  }
}
