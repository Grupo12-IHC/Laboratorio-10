import 'package:chat_unsa/widgets/navigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_unsa/constant.dart';

class Busqueda extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: NavigationBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: size.width-30,
                    height: 45,
                    decoration: BoxDecoration(
                      color: colorTerciario,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white.withOpacity(0.3),
                        )
                      ),
                      cursorColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: colorTerciario,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Correo institucional'
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: colorTerciario,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'CUI'
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: colorTerciario,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Nombre'
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}