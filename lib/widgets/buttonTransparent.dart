
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonTransparent extends StatelessWidget {
  final Widget child;
  const ButtonTransparent({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}