
import 'file:///D:/Proyectos/LAb%2009/Laboratorio-08/lib/Widgets/button.dart';
import 'file:///D:/Proyectos/LAb%2009/Laboratorio-08/lib/Widgets/textFieldContainer.dart';
import 'package:chat_unsa/constant.dart';
import 'package:chat_unsa/listview_contacto.dart';
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
                    MaterialPageRoute(builder: (context) => ListViewProduct()),
                  );
                },
                child: Text(
                  'Enviar codioo de recuperacion',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
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
