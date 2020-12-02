
import 'package:chat_unsa/notificaciones.dart';
import 'package:chat_unsa/widgets/navigationBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_unsa/constant.dart';

class Notificaciones extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    CollectionReference noticaciones = FirebaseFirestore.instance.collection('notificaciones');
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Notificaciones',
          style: TextStyle(
            color: colorPrimario,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: NavigationBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: noticaciones.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Al parecer a ocurrido un error');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Cargando ....");
            }

            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return Container(
                  width: size.width * 0.8,
                  height: size.height * 0.1,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: colorTerciario,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: size.width * 0.2,
                          height: size.height * 0.1,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: colorSecundario,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                document.data()['mes'],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                document.data()['dia'],
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        document.data()['notificacion'],
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}