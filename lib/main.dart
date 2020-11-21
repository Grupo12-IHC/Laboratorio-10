import 'dart:async';

import 'package:chat_unsa/constant.dart';
import 'package:chat_unsa/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 120),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Login()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                child: Image.asset('assets/images/login.png'),
              ),
              RichText(
                text: TextSpan(
                  children:[
                    TextSpan(
                      text: 'Iniciando ...',
                      style: GoogleFonts.satisfy(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
      ),

      //Image.asset('assets/icon/inicio.png'),
    );
  }
}