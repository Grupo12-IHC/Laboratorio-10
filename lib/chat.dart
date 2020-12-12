import 'package:chat_unsa/widgets/navigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_unsa/constant.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ChatUnsa',
          style: TextStyle(
            color: colorPrimario,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}