import 'package:chat_unsa/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget child;
  const Button({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: size.width * 0.7,
      decoration: BoxDecoration(
        color: colorPrimario,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}