import 'file:///D:/Proyectos/LAb%2009/Laboratorio-08/lib/Widgets/button.dart';
import 'file:///D:/Proyectos/LAb%2009/Laboratorio-08/lib/Widgets/buttonTransparent.dart';
import 'file:///D:/Proyectos/LAb%2009/Laboratorio-08/lib/Widgets/textFieldContainer.dart';
import 'package:chat_unsa/constant.dart';
import 'package:chat_unsa/listview_contacto.dart';
import 'package:chat_unsa/recover.dart';
import 'package:chat_unsa/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Internalización
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chat_unsa/generated/l10n.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email.trim(), password: _password);
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
    Size size = MediaQuery.of(context).size;
      return Scaffold(
        floatingActionButton: SpeedDial(
          child: Icon(
            Icons.language,
            color: Colors.white,
          ),
          overlayColor: Colors.white.withOpacity(0.3),
          backgroundColor: colorPrimario,
          children: [
            SpeedDialChild(
                child: Image.asset('assets/icon/peru.png'),
                backgroundColor: Colors.white,
                onTap: () {
                  setState(() {
                    S.load(Locale('es'));
                  });
                }
            ),
            SpeedDialChild(
              child: Image.asset('assets/icon/eeuu.png'),
              backgroundColor: Colors.white,
                onTap: () {
                  setState(() {
                    S.load(Locale('en'));
                  });
                }
            ),
            SpeedDialChild(
              child: Image.asset('assets/icon/brasil.png'),
              backgroundColor: Colors.white,
                onTap: () {
                  setState(() {
                    S.load(Locale('pt'));
                  });
                }
            )
          ],
        ),
        body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/chat_unsa.png'),
                width: size.width* 0.7,
              ),
              TextFieldContainer(
                child: TextFormField(
                  onChanged: (value) {
                    _email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return S.of(context).ingreseDatosText;
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: S.of(context).correoInstitucionalText,
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
                      return S.of(context).ingreseDatosText;
                    }
                    return null;
                  },
                  decoration:
                  InputDecoration(labelText: S.of(context).contraText),
                ),
              ),
              Button(
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      _login();
                    }
                  },
                  child: Text(
                    S.of(context).iniciarSesionText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ButtonTransparent(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Recover()),
                    );
                  },
                  child: Text(
                    S.of(context).preguntaOlvidasteContraText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
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
                    text: TextSpan(children: [
                      TextSpan(
                        text: S.of(context).preguntaNoTienesCuentaText,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: S.of(context).registrateAquiText,
                        style: TextStyle(
                            fontSize: 15,
                            color: colorPrimario,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      );
  }

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).alertaText),
          content: Text(S.of(context).usuarioNoExistenteText),
        );
      },
    );
  }
}
