
import 'package:chat_unsa/Button.dart';
import 'package:chat_unsa/ButtonTransparent.dart';
import 'package:chat_unsa/TextFieldContainer.dart';
import 'package:chat_unsa/constant.dart';
import 'package:chat_unsa/menu.dart';
import 'package:chat_unsa/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.white,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: colorPrimario,
          title: Text('Recuperacion de cuenta'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();

  @override


  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage('assets/images/login.png')
            ),
            /*TextFieldContainer(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Ingrese datos';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'CUI'
                ),
              ),
            ),*/
            TextFieldContainer(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Ingrese datos';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Correo institucional'
                ),
              ),
            ),
            Button(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu()),
                  );
                },
                child: Text(
                  'Iniciar sesion',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
/*
var auth = firebase.auth();
var emailAddress = "user@example.com";

auth.sendPasswordResetEmail(emailAddress).then(function() {
  // Email sent.
}).catch(function(error) {
  // An error happened.
});
 */