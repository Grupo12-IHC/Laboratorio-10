// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static m0(correo) => "Correo: ${correo}";

  static m1(cui) => "CUI: ${cui}";

  static m2(escuela) => "Escuela Profesional: ${escuela}";

  static m3(nombre) => "Nombre: ${nombre}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "actualizarText" : MessageLookupByLibrary.simpleMessage("Actualizar"),
    "agregarText" : MessageLookupByLibrary.simpleMessage("Agregar"),
    "alertaText" : MessageLookupByLibrary.simpleMessage("Alerta"),
    "cancelarText" : MessageLookupByLibrary.simpleMessage("Cancelar"),
    "contactoText" : MessageLookupByLibrary.simpleMessage("Contacto"),
    "contraText" : MessageLookupByLibrary.simpleMessage("Contraseña"),
    "correoInstitucionalText" : MessageLookupByLibrary.simpleMessage("Correo Institucional"),
    "correoPlaceHolder" : m0,
    "correoText" : MessageLookupByLibrary.simpleMessage("Correo"),
    "cuiPlaceHolder" : m1,
    "cuiText" : MessageLookupByLibrary.simpleMessage("CUI"),
    "escuelaPlaceHolder" : m2,
    "escuelaText" : MessageLookupByLibrary.simpleMessage("Escuela Profesional"),
    "informacionContactoText" : MessageLookupByLibrary.simpleMessage("Información del Contacto"),
    "informacionUsuarioText" : MessageLookupByLibrary.simpleMessage("Información del Usuario"),
    "ingreseDatosText" : MessageLookupByLibrary.simpleMessage("Ingrese Datos"),
    "iniciarSesionText" : MessageLookupByLibrary.simpleMessage("Iniciar Sesión"),
    "listaContactosText" : MessageLookupByLibrary.simpleMessage("Lista de Contactos"),
    "nombrePlaceHolder" : m3,
    "nombreText" : MessageLookupByLibrary.simpleMessage("Nombre"),
    "preguntaEliminarContactoText" : MessageLookupByLibrary.simpleMessage("¿Está seguro de eliminar este contacto?"),
    "preguntaNoTienesCuentaText" : MessageLookupByLibrary.simpleMessage("¿No tienes cuenta?"),
    "preguntaOlvidasteContraText" : MessageLookupByLibrary.simpleMessage("¿Olvidaste tu contraseña?"),
    "recuperacionCuentaText" : MessageLookupByLibrary.simpleMessage("Recuperacion de cuenta"),
    "recuperacionText" : MessageLookupByLibrary.simpleMessage("Enviar codigo de recuperacion"),
    "registrarseText" : MessageLookupByLibrary.simpleMessage("Registrarse"),
    "registrateAquiText" : MessageLookupByLibrary.simpleMessage("Registrate aquí"),
    "usuarioNoExistenteText" : MessageLookupByLibrary.simpleMessage("El usuario que usted ha ingresado no existe")
  };
}
