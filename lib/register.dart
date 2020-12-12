import 'file:///D:/Proyectos/LAb%2009/Laboratorio-08/lib/Widgets/button.dart';
import 'file:///D:/Proyectos/LAb%2009/Laboratorio-08/lib/Widgets/textFieldContainer.dart';
import 'package:chat_unsa/constant.dart';
import 'package:chat_unsa/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Internalización
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chat_unsa/generated/l10n.dart';


class Register extends StatefulWidget {



  @override
  _RegisterState createState() => _RegisterState();

}

class _RegisterState extends State<Register> {
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
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          title: new Text(
            S.of(context).registrarseText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: colorPrimario,
        ),
        backgroundColor: Colors.white,
        body: MyCustomForm(),

      ),
      //Internaliación
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
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

  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    } catch (e) {
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
            Image(image: AssetImage('assets/images/login.png')),
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
                decoration: InputDecoration(labelText: S.of(context).correoInstitucionalText),
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                onChanged: (value) {
                  _password = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Ingrese datos';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: S.of(context).contraText),
                obscureText: true,
              ),
            ),
            Button(
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    _createUser();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  } //;
                },
                child: Text(
                  S.of(context).registrarseText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
