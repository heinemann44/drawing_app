import 'package:drawing_app/features/drawing/controller/draw_controller.dart';
import 'package:drawing_app/features/drawing/view/menu_color.dart';
import 'package:drawing_app/features/drawing/view/menu_stroke.dart';
import 'package:flutter/material.dart';

class FloatingMenu extends StatefulWidget {
  final DrawController drawController;

  const FloatingMenu({Key key, this.drawController}) : super(key: key);

  @override
  _FloatingMenuState createState() => _FloatingMenuState();
}

class _FloatingMenuState extends State<FloatingMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _animationControllerMenu;

  @override
  void initState() {
    this._buildAnimationController();
    super.initState();
  }

  void _buildAnimationController() {
    this._animationControllerMenu = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: this.widget.drawController.timeAnimation,
      ),
    );
  }

  @override
  void dispose() {
    this._animationControllerMenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        this._buildMenuOptions(),
        FloatingActionButton(
          onPressed: this._handleOnTapMenu,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: this._animationControllerMenu,
          ),
        ),
      ],
    );
  }

  void _handleOnTapMenu() {
    this._animateMenu();
  }

  void _animateMenu() {
    if (this.widget.drawController.isOpenMenu) {
      this._animationControllerMenu.reverse();
    } else {
      this._animationControllerMenu.forward();
    }
    setState(() => this.widget.drawController.updateMenuState());
  }

  Widget _buildMenuOptions() {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: this.widget.drawController.timeAnimation,
      ),
      width: 56,
      height: this.widget.drawController.isOpenMenu ? 350 : 56,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          MenuColor(drawController: this.widget.drawController),
          MenuStroke(drawController: this.widget.drawController),
        ],
      ),
    );
  }

}
