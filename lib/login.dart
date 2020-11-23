
import 'package:chat_unsa/Button.dart';
import 'package:chat_unsa/ButtonTransparent.dart';
import 'package:chat_unsa/TextFieldContainer.dart';
import 'package:chat_unsa/constant.dart';
import 'package:chat_unsa/listview_contacto.dart';
import 'package:chat_unsa/menu.dart';
import 'package:chat_unsa/recover.dart';
import 'package:chat_unsa/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
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

  String _email;
  String _password;

  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListViewProduct()),
      );
    } on FirebaseAuthException catch (e) {
      _showDialog(context);
      print('Error: $e');
    } catch (e) {
      _showDialog(context);
      print('Error: $e');
    }
  }

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
            TextFieldContainer(
              child: TextFormField(
                onChanged: (value) {
                  _email = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Ingrese datos';
                  }
                  return null;
                },
                style: TextStyle(
                  color: Colors.black
                ),
                decoration: InputDecoration(
                    labelText: 'Correo institucional',

                ),

              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                onChanged: (value) {
                  _password = value;
                },
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Ingrese datos';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Contraseña'
                ),
              ),
            ),
            Button(
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState.validate()){
                    _login();
                  }
                  //if (_formKey.currentState.validate()){}
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
            ButtonTransparent(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Recover()),
                  );
                },
                child: Text(
                  '¿Olvidastes tu constraseña?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            ButtonTransparent(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '¿No tienes cuenta? ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpan(
                        text: 'Registrate aqui',
                        style: TextStyle(
                            fontSize: 15,
                            color: colorPrimario,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: Text('El usuario que usted ha ingresado no existe.'),
        );
      },
    );
  }
}

