
import 'package:chat_unsa/busqueda.dart';
import 'package:chat_unsa/chat.dart';
import 'package:chat_unsa/notificaciones.dart';
import 'package:chat_unsa/perfil.dart';
import 'package:chat_unsa/widgets/menuButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MenuButton(
              ontap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chat()),
                );
              },
              child: Icon(
                Icons.chat_outlined,
                color: Colors.black,
              ),
            ),
            MenuButton(
              ontap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Busqueda()),
                );
              },
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            MenuButton(
              ontap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notificaciones()),
                );
              },
              child: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
            ),
            MenuButton(
              ontap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Perfil()),
                );
              },
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}