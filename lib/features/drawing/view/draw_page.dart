import 'package:drawing_app/features/drawing/controller/draw_controller.dart';
import 'package:drawing_app/features/drawing/view/drawer_table.dart';
import 'package:drawing_app/features/drawing/view/floating_menu.dart';
import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage>
    with SingleTickerProviderStateMixin {
  Size size;
  DrawerTable drawer;
  DrawController _drawController;

  @override
  void initState() {
    super.initState();
    this.size = Size(300, 300);
    this._drawController = DrawController();
    this.drawer = DrawerTable(
      size: this.size,
      controller: this._drawController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: this._buildAppBar(),
        body: this._buildBody(),
        floatingActionButton: FloatingMenu(
          drawController: this._drawController,
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("Draw!"),
    );
  }

  Widget _buildBody() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: DrawerTable(
              size: this.size,
              controller: this._drawController,
            ),
          ),
        ),
        this._buildResetButton(),
      ],
    );
  }

  Widget _buildResetButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "Reset",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        padding: const EdgeInsets.all(8),
        fillColor: Theme.of(context).primaryColor,
        onPressed: () {
          this._drawController.resetDraw();
          setState(() {});
        },
      ),
    );
  }
}
