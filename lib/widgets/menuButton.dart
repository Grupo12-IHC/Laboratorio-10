import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final GestureTapCallback ontap;
  final Widget child;
  const MenuButton({
    Key key,
    this.ontap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 50,
        color: Colors.white,
        child: child,
      ),
    );
  }
}