import 'dart:async';

import 'package:chat_unsa/listview_contacto.dart';
import 'package:chat_unsa/login.dart';
import 'package:chat_unsa/menu.dart';
import 'package:chat_unsa/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat unsa',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: _initialization,
        builder: (context, snapshot){
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text( "Error: ${snapshot.error}" ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if ( snapshot.connectionState == ConnectionState.active){
                    User user = snapshot.data;
                    if(user == null){
                      return MyHomePage();
                    }else {
                      return ListViewProduct();
                    }
                  }
                  return Scaffold(
                    body: Center(
                      child: Text('Cargando ...'),
                    ),
                  );
                },

            );
          }
          return Scaffold(
            body: Center(
              child: Text('Cargando ...'),
            ),
          );
        }
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
    Timer(Duration(seconds: 3),
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
                child: Image.asset('assets/images/login.png'),
              ),
            ],
          )
      ),
    );
  }
}