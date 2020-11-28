import 'dart:async';
import 'package:chat_unsa/chat_unsa.dart';
import 'package:chat_unsa/listview_contacto.dart';
import 'package:chat_unsa/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
            return Carga();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if ( snapshot.connectionState == ConnectionState.active){
                    User user = snapshot.data;
                    if(user == null){
                      return Carga();
                    }else {
                      return ListViewProduct();
                    }
                  }
                  return Carga();
                },

            );
          }
          return Carga();
        }
    );
  }
}
