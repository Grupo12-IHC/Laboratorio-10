import 'package:chat_unsa/constant.dart';
import 'package:chat_unsa/widgets/navigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
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