import 'package:drawing_app/features/drawing/view/draw_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this._buildAppBar(),
      body: this._buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("Drawing"),
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          this._buildStartDrawButton(),
        ],
      ),
    );
  }

  Widget _buildStartDrawButton() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: FlatButton(
        child: Text("Start Draw!"),
        onPressed: this._sendToDrawPage,
      ),
    );
  }

  void _sendToDrawPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => DrawPage(),
    ));
  }

}
