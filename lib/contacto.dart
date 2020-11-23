import 'package:firebase_database/firebase_database.dart';

class Contacto {
  String _id;
  String _nombre;
  String _cui;
  String _correo;
  String _escuela;
  String _contactoImage;

  Contacto(this._id, this._nombre, this._cui, this._correo, this._escuela,
      this._contactoImage);

  Contacto.map(dynamic obj) {
    this._nombre = obj['nombre'];
    this._cui = obj['cui'];
    this._correo = obj['correo'];
    this._escuela = obj['escuela'];
    this._contactoImage = obj['ContactoImage'];
  }

  String get id => _id;
  String get nombre => _nombre;
  String get cui => _cui;
  String get correo => _correo;
  String get escuela => _escuela;
  String get contactoImage => _contactoImage;

  Contacto.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _nombre = snapshot.value['nombre'];
    _cui = snapshot.value['cui'];
    _correo = snapshot.value['correo'];
    _escuela = snapshot.value['escuela'];
    _contactoImage = snapshot.value['ContactoImage'];
  }
}
