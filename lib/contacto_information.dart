import 'package:chat_unsa/constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'file:///D:/Proyectos/chat_unsa2/lib/contacto.dart';
import 'package:chat_unsa/contacto.dart';

//Internalización
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chat_unsa/generated/l10n.dart';

class ContactoInformation extends StatefulWidget {
  final Contacto contacto;
  ContactoInformation(this.contacto);
  @override
  _ContactoInformationState createState() => _ContactoInformationState();
}

final productReference =
    FirebaseDatabase.instance.reference().child('contacto');

class _ContactoInformationState extends State<ContactoInformation> {
  List<Contacto> items;

  String productImage; //nuevo

  @override
  void initState() {
    super.initState();
    productImage = widget.contacto.contactoImage; //nuevo
    print(productImage); //nuevo
  }

  @override
  Widget build(BuildContext context) {
    //Internaliación
    localizationsDelegates:
    [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      S.delegate
    ];
    supportedLocales:
    S.delegate.supportedLocales;
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: colorPrimario,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          S.of(context).informacionUsuarioText,
          style: TextStyle(color: colorPrimario),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                new Container(
                    padding: new EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/icon/user.png',
                      width: 150,
                      height: 150,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Text(
                  S.of(context).nombrePlaceHolder(widget.contacto.nombre),
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                new Text(
                  S.of(context).cuiPlaceHolder(widget.contacto.cui),
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                new Text(
                  S.of(context).correoPlaceHolder(widget.contacto.correo),
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                new Text(
                  S.of(context).escuelaPlaceHolder(widget.contacto.escuela),
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
