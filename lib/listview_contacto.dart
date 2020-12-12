import 'package:chat_unsa/constant.dart';
import 'package:chat_unsa/contacto_information.dart';
import 'package:chat_unsa/contacto_screen.dart';
import 'package:chat_unsa/grafics_chart.dart';
import 'package:chat_unsa/mensj_unsa.dart';

import 'package:chat_unsa/widgets/navigationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

import 'package:chat_unsa/contacto.dart';
//import 'file:///D:/Proyectos/chat_unsa2/lib/contacto.dart';

//Internalización
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chat_unsa/generated/l10n.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ListViewProduct extends StatefulWidget {
  @override
  _ListViewProductState createState() => _ListViewProductState();
}

final contactoReference =



FirebaseDatabase.instance.reference().child('contacto');

class _ListViewProductState extends State<ListViewProduct> {
  List<Contacto> items;
  StreamSubscription<Event> _onContactotAddedSubscription;
  StreamSubscription<Event> _onContactoChangedSubscription;

  @override
  void initState() {
    super.initState();
    items = new List();
    _onContactotAddedSubscription =
        contactoReference.onChildAdded.listen(_onContactoAdded);
    _onContactoChangedSubscription =
        contactoReference.onChildChanged.listen(_onContactoUpdate);
  }

  @override
  void dispose() {
    super.dispose();
    _onContactotAddedSubscription.cancel();
    _onContactoChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Internaliación
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: NavigationBar(),
        appBar: AppBar(
          title: Text(
            S.of(context).listaContactosText,
            style: TextStyle(
              color: colorPrimario,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                icon: new Icon(
                  Icons.logout,
                  color: colorPrimario,
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                }),
          ],
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(
                      height: 1.0,
                    ),
                    Container(
                      padding: new EdgeInsets.all(15),
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            //nuevo imagen
                            new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: Image.asset(
                                  'assets/icon/user.png',
                                  width: 50,
                                  height: 50,
                                )),
                            Expanded(
                              child: ListTile(
                                  title: Text(
                                    '${items[position].nombre}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${items[position].cui}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  onTap: () => _navigateToContactoInformation(
                                      context, items[position])),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                              onPressed: () => _showDialog(context, position),
                            ),

                            IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black,
                                ),
                                onPressed: () => _navigateToContacto(
                                    context, items[position])
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.chat,
                                color: Colors.black,
                              ),
                              onPressed: ()=> _mensajesChat(
                                  context, items[position]
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
        ),
        floatingActionButton: SpeedDial(
          child: Icon(
            Icons.touch_app,
            color: Colors.white,
          ),
          backgroundColor: colorPrimario,
          children: [
            SpeedDialChild(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onTap: () => _createNewContacto(context),
            ),
            SpeedDialChild(
                child: Icon(
                  Icons.add_chart,
                  color: Colors.white,
                ),
                onTap: () => _graficChart(context)
            ),
          ],
        ),
      ),
    );
  }

  //nuevo para que pregunte antes de eliminar un registro
  void _showDialog(context, position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).alertaText),
          content: Text(S.of(context).preguntaEliminarContactoText),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: colorPrimario,
              ),
              onPressed: () => _deleteContacto(
                context,
                items[position],
                position,
              ),
            ),
            new FlatButton(
              child: Text(S.of(context).cancelarText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onContactoAdded(Event event) {
    setState(() {
      items.add(new Contacto.fromSnapShot(event.snapshot));
    });
  }

  void _onContactoUpdate(Event event) {
    var oldContactoValue =
        items.singleWhere((contacto) => contacto.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldContactoValue)] =
          new Contacto.fromSnapShot(event.snapshot);
    });
  }

  void _deleteContacto(
      BuildContext context, Contacto contacto, int position) async {
    await contactoReference.child(contacto.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
        Navigator.of(context).pop();
      });
    });
  }

  void _navigateToContactoInformation(
      BuildContext context, Contacto contacto) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactoScreen(contacto)),
    );
  }

  void _navigateToContacto(BuildContext context, Contacto contacto) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactoInformation(contacto)),
    );
  }

  void _createNewContacto(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ContactoScreen(Contacto(null, '', '', '', '', ''))),
    );
  }
  void _mensajesChat(BuildContext context, Contacto contacto) async{
    await Navigator.push(
      context,
      MaterialPageRoute(builder:(context)=> MensajesChat(contacto)),
    );
  }
  void _graficChart(BuildContext context) async{
    await Navigator.push(
      context,
      MaterialPageRoute(builder:(context)=> GraficChart(null)),
    );
  }
}




