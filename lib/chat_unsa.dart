

import 'dart:async';

import 'package:chat_unsa/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat unsa',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Carga(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Carga extends StatefulWidget {
  @override
  Pantalla_carga createState() => Pantalla_carga();
}
class Pantalla_carga extends State<Carga> {



  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Login()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                    'assets/images/chat_unsa.png',
                  width: 300,
                ),
              ),
            ],
          )
      ),
    );
  }
}