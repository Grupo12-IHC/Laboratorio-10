import 'package:chat_unsa/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'file:///D:/Proyectos/chat_unsa2/lib/contacto.dart';
import 'dart:io';


File image;
String filename;

class ContactoScreen extends StatefulWidget {
  final Contacto contacto;
  ContactoScreen(this.contacto);
  @override
  _ContactoScreenState createState() => _ContactoScreenState();
}

final contactoReference =
    FirebaseDatabase.instance.reference().child('contacto');

class _ContactoScreenState extends State<ContactoScreen> {
  List<Contacto> items;

  TextEditingController _nombreController;
  TextEditingController _cuiController;
  TextEditingController _correoController;
  TextEditingController _escuelaController;

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nombreController = new TextEditingController(text: widget.contacto.nombre);
    _cuiController = new TextEditingController(text: widget.contacto.cui);
    _correoController = new TextEditingController(text: widget.contacto.correo);
    _escuelaController =
        new TextEditingController(text: widget.contacto.escuela);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: colorPrimario,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Contacto',
           style: TextStyle(
             color: colorPrimario,
           ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        //height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          margin: EdgeInsets.all(15),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _nombreController,
                  style:
                      TextStyle(
                          fontSize: 17.0,
                          color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Nombre'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                TextField(
                  controller: _cuiController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(Icons.credit_card_outlined),
                      labelText: 'CUI'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Divider(),
                TextField(
                  controller: _correoController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Correo'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Divider(),
                TextField(
                  controller: _escuelaController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.black),
                  decoration: InputDecoration(
                      icon: Icon(Icons.school),
                      labelText: 'Escuela'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),

                FlatButton(
                    onPressed: () {
                      if (widget.contacto.id != null) {
                        var part1 =
                            'https://firebasestorage.googleapis.com/v0/b/flutterimagen.appspot.com/o/';
                        contactoReference.child(widget.contacto.id).set({
                          'nombre': _nombreController.text,
                          'cui': _cuiController.text,
                          'correo': _correoController.text,
                          'escuela': _escuelaController.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      } else {

                        var part1 =
                            'https://firebasestorage.googleapis.com/v0/b/flutterimagen.appspot.com/o/';

                        contactoReference.push().set({
                          'nombre': _nombreController.text,
                          'cui': _cuiController.text,
                          'correo': _correoController.text,
                          'escuela': _escuelaController.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.contacto.id != null)
                        ? Text(
                        'Actualizar',
                      style: TextStyle(
                        color: colorPrimario,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        : Text(
                      'Agregar',
                      style: TextStyle(
                        color: colorPrimario,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
