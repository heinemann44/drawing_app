import 'package:drawing_app/features/drawing/view/drawer_table.dart';
import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  Size size;
  DrawerTable drawer;

  @override
  void initState() {
    super.initState();
    this.size = Size(300, 300);
    this.drawer = DrawerTable(size: this.size);
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
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: this.drawer,
      ),
    );
  }
}
